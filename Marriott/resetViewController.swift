//
//  resetViewController.swift
//  Marriott
//
//  Created by User on 3/7/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase

class resetViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePopUp(_ sender: Any) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
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

    @IBAction func resetpasswordaction(_ sender: Any) {
        guard let email = emailTextField.text else{return}
        if (email != ""){
            Auth.auth().sendPasswordReset(withEmail: email) { (error) in
                if error != nil{
                    self.createAlert(title: "Warning", message: "Email address doens't match our record")
                    print(error)
                    return
                }
                self.view.removeFromSuperview()
                self.createAlert(title: "Message", message: "password reset has been sent to your email")
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
