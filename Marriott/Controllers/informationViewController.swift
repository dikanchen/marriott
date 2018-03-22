//
//  informationViewController.swift
//  Marriott
//
//  Created by User on 3/20/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase

var sumnights = 0

class informationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var hotelnameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nightsLabel: UILabel!
    @IBOutlet weak var guestsLabel: UILabel!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var ratesLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var dailypriceLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(daysarr)
        let daysintarr = daysarr.map{
            Int($0)!
        }
        
        sumnights = daysintarr.reduce(0, +)
        print(sumnights)
        
        if dlroomtype == "Guest room, 2 Queen, Stadium OR City view"{
            imageView.image = #imageLiteral(resourceName: "21477_237_z.jpg")
        }else{
            imageView.image = #imageLiteral(resourceName: "84369910.jpg")
        }
        
        hotelnameLabel.text = dlhotelname
        addressLabel.text = dladdress
        nightsLabel.text = dlnights
        ratesLabel.text = dlrates
        guestsLabel.text = dlrooms
        roomsLabel.text = dlroomtype
        taxLabel.text = dltax
        totalLabel.text = dltotalprice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func cancelBtntapped(_ sender: Any) {
        createAlert(title: "Message", message: "Are you sure to cancel this booking order?")
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "back", sender: self)
                let uid = Auth.auth().currentUser?.uid
                let ref = Database.database().reference().child("users").child(uid!).child("bookedhotels").child("booked")
                ref.child(id).setValue(nil)
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
