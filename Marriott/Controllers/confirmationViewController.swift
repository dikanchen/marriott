//
//  confirmationViewController.swift
//  Marriott
//
//  Created by User on 3/19/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase

var totalprice = ""

class confirmationViewController: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()

        // Do any additional setup after loading the view.
        
        myScrollView.contentSize = CGSize(width: view.frame.width, height: 1200)
        if let featureView = Bundle.main.loadNibNamed("scroll", owner: self, options: nil)?.first as? scroll{
            if roomname == "Guest room, 2 Queen, Stadium OR City view"{
                featureView.imageView.image = #imageLiteral(resourceName: "21477_237_z.jpg")
            }else{
                featureView.imageView.image = #imageLiteral(resourceName: "84369910.jpg")
            }
            featureView.hotelnameLabel.text = hotelname
            featureView.addressLabel.text = address
            featureView.datesLabel.text = "\(datenumber)~\(enddatenumber)"
            featureView.nightsLabel.text = "\(datenumber)~\(enddatenumber), \(days) nights"
            featureView.priceLabel.text = "\(String(format:"%.2f", Double(dailyprice)!)) USD"
            let tax = 0.06 * Double(dailyprice)!
            featureView.taxLabel.text = "\(String(format:"%.2f", Double(tax) * Double(roomnumber) * Double(days))) USD"
            totalprice = String(format:"%.2f", (Double(tax) + Double(dailyprice)!) * Double(roomnumber) * Double(days))
            featureView.totalpriceLabel.text = "\(totalprice) USD"
            featureView.roomtypeLabel.text = roomname
            featureView.roomsLabel.text = "\(roomnumber) ROOM, \(guestnumber) GUEST"
            featureView.ratesLabel.text = memberrate
            myScrollView.addSubview(featureView)
            confirmBtn.setTitle("Book Now \(totalprice) USD", for: .normal)
            featureView.frame.size.height = self.view.bounds.size.height
            featureView.frame.size.width = self.view.bounds.size.width
            
        }
    }
    
    @IBAction func closepop(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBAction func confirmtapped(_ sender: Any) {
        createAlert(title: "Confirmation", message: "Are you sure to book this hotel?")
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "history", sender: self)
                let uid = Auth.auth().currentUser?.uid
                let ref = Database.database().reference().child("users").child(uid!).child("bookedhotels").child("booked")
                let key = ref.childByAutoId().key
                let values = ["hotelname":hotelname, "address": address, "dates":"\(datenumber)~\(enddatenumber)", "nights": "\(datenumber)~\(enddatenumber), \(days) nights", "dailyprice": "\(String(format:"%.2f", Double(dailyprice)!)) USD", "tax": "\(String(format:"%.2f", 0.06 * Double(dailyprice)! * Double(roomnumber) * Double(days))) USD", "totalprice": "\(String(format:"%.2f", (0.06 * Double(dailyprice)! + Double(dailyprice)!) * Double(roomnumber) * Double(days))) USD", "roomtype": roomname, "rooms": "\(roomnumber) ROOM, \(guestnumber) GUEST", "rates": memberrate, "childRef": key, "days": "\(days)"]
                ref.child(key).updateChildValues(values)
            }
        }))
        
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
