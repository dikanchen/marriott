//
//  popupViewController.swift
//  Marriott
//
//  Created by User on 3/20/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase

class popupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var firstnameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var countryTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var confirmTextfield: UITextField!
    
    var pickerView: UIPickerView!
    var countryArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()

        // Do any additional setup after loading the view.
        
        countryArray.append("--Choose--")
        
        for code in NSLocale.isoCountryCodes as [String]{
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_EN").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countryArray.append(name)
            countryArray.sort(by: { (name1, name2) -> Bool in
                name1 < name2
            })
        }
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        countryTextfield.inputView = pickerView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(popupViewController.dismissController(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissController(gesture:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextfield.text = countryArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = NSAttributedString(string: countryArray[row], attributes: [NSAttributedStringKey.foregroundColor: UIColor.black])
        return title
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closepop(_ sender: Any) {
        self.removeAnimate()
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        },completion:{(finished:Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func jointapped(_ sender: Any) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text, let name = firstnameTextfield.text  else{return}
        if (firstnameTextfield.text != "" && lastnameTextfield.text != "" && countryTextfield.text != "" && emailTextfield.text != "" && passwordTextfield.text != "" && confirmTextfield.text != ""){
            if passwordTextfield.text == confirmTextfield.text{
                Auth.auth().createUser(withEmail: email, password: password, completion: {(user:User?, error) in
                    if error != nil{
                        self.createAlert(title: "Warning", message: "Email is already in use")
                        return
                    }
                    guard let uid = user?.uid else{return}
                    let ref = Database.database().reference(fromURL: "https://marriot-95221.firebaseio.com/")
                    let usersReference = ref.child("users").child(uid)
                    let values = ["First name": name, "email": email]
                    usersReference.updateChildValues(values)
                    self.performSegue(withIdentifier: "segue", sender: self)
                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(email, forKey: "storedemail")
                })
            }else{
                createAlert(title: "Warning", message: "Password confirmation doesn't match")
            }
            
        }else{
            createAlert(title: "Warning", message: "Please fill in all the required blanks")
        }
        
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
