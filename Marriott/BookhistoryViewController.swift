//
//  BookhistoryViewController.swift
//  Marriott
//
//  Created by User on 3/19/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase

var dladdress = ""
var id = ""
var dldailyprice = ""
var dldates = ""
var dldays = 0
var dlhotelname = ""
var dlnights = ""
var dlrates = ""
var dlrooms = ""
var dlroomtype = ""
var dltax = ""
var dltotalprice = ""
var daysarr = [String]()

class BookhistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var bookedhotellist = [Hotelinfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        observeMessages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func logout(_ sender: Any) {
        createAlert(title: "Message", message: "Are you sure to sign out?")
    }
    
    func createAlert(title:String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
            DispatchQueue.main.async {
                UserDefaults.standard.removeObject(forKey: "email")
                self.performSegue(withIdentifier: "logout", sender: self)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func observeMessages(){
        let uid = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child("users").child(uid!).child("bookedhotels").child("booked")
        ref.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String:AnyObject] {
                let fbhotelname = dictionary["hotelname"]
                let fbaddress = dictionary["address"]
                let fbchildref = dictionary["childRef"]
                let fbdailyprice = dictionary["dailyprice"]
                let fbdates = dictionary["dates"]
                let fbnights = dictionary["nights"]
                let fbrates = dictionary["rates"]
                let fbrooms = dictionary["rooms"]
                let fbtypes = dictionary["roomtype"]
                let fbtax = dictionary["tax"]
                let fbtotalprice = dictionary["totalprice"]
                let fbdays = dictionary["days"]
                
                let bookedhotels = Hotelinfo(fbhotelname: fbhotelname as! String?, fbaddress: fbaddress as! String?, fbchildref: fbchildref as! String?, fbdailyprice: fbdailyprice as! String?, fbdates: fbdates as! String?, fbnights: fbnights as! String?, fbrates: fbrates as! String?, fbrooms: fbrooms as! String?, fbtypes: fbtypes as! String?, fbtax: fbtax as! String?, fbtotalprice: fbtotalprice as! String?, fbdays: fbdays as! String?)
                
                self.bookedhotellist.append(bookedhotels)
                
                self.tableView.reloadData()
            }
            
            print(snapshot)
            
        }, withCancel: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookedhotellist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! bookedTableViewCell
        cell.hotelnameLabel.text = bookedhotellist[indexPath.row].fbhotelname
        cell.dateLabel.text = bookedhotellist[indexPath.row].fbdates
        dladdress = bookedhotellist[indexPath.row].fbaddress!
        id = bookedhotellist[indexPath.row].fbchildref!
        dldailyprice = bookedhotellist[indexPath.row].fbdailyprice!
        dldates = bookedhotellist[indexPath.row].fbdates!
        dlhotelname = bookedhotellist[indexPath.row].fbhotelname!
        dlnights = bookedhotellist[indexPath.row].fbnights!
        dlrates = bookedhotellist[indexPath.row].fbrates!
        dlrooms = bookedhotellist[indexPath.row].fbrooms!
        dlroomtype = bookedhotellist[indexPath.row].fbtypes!
        dltax = bookedhotellist[indexPath.row].fbtax!
        dltotalprice = bookedhotellist[indexPath.row].fbtotalprice!
        daysarr.append(bookedhotellist[indexPath.row].fbdays!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: self)
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
