//
//  popup2ViewController.swift
//  Marriott
//
//  Created by User on 3/6/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication

class popup2ViewController: UIViewController {
    @IBOutlet weak var unchecked: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    var check = UIImage(named: "User-Interface-Checked-Checkbox-icon")
    var uncheck = UIImage(named: "User-Interface-Unchecked-Checkbox-icon")
    
    var isclicked: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()

        // Do any additional setup after loading the view.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        guard let emailaddress = UserDefaults.standard.object(forKey: "storedemail") as? String else{return}
        emailText.text = emailaddress
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ClickBox(_ sender: Any) {
        guard let email = emailText.text else{return}
        if isclicked == true{
            isclicked = false
        }else{
            isclicked = true
        }
        
        if isclicked == true{
            unchecked.setImage(uncheck, for: UIControlState.normal)
            
            let authenticationObject = LAContext()
            var authenticationError:NSError?
            
            authenticationObject.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &authenticationError)
            if email != ""{
                if authenticationError != nil{
                    self.createAlert(title: "Warning", message: "Touch ID not available on this version of iOS")
                    print("Authentication not available on this version of iOS")
                }else{
                    authenticationObject.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Log in via Touch ID", reply: { (complete, error) in
                        if error != nil{
                            print(error?.localizedDescription)
                        }else{
                            if complete == true{
                                print("Authentication successful")
                                DispatchQueue.main.async {
                                    UserDefaults.standard.set(email, forKey: "email")
                                    UserDefaults.standard.set(email, forKey: "storedemail")
                                    self.performSegue(withIdentifier: "login", sender: nil)
                                }
                            }else{
                                print("Authentication failed")
                            }
                        }
                    })
                }
            }else{
                self.createAlert(title: "Warning", message: "Please fill in Email address first")
            }
            
            
        }else{
            unchecked.setImage(check, for: UIControlState.normal)
        }
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
    
    @IBAction func Login(_ sender: Any) {
        guard let email = emailText.text, let password = passwordText.text else{return}
        if (email != "" && password != ""){
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error != nil{
                    print(error)
                    self.createAlert(title: "Login Failed", message: "Email or password is incorrect")
                    return
                }
                UserDefaults.standard.set(email, forKey: "email")
                UserDefaults.standard.set(email, forKey: "storedemail")
                self.performSegue(withIdentifier: "login", sender: nil)
            })
        }else{
            createAlert(title: "Warning", message: "Please fill in all the blanks")
        }
        
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showPopup(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "reset") as! resetViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
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
