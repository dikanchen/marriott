//
//  optionsViewController.swift
//  Marriott
//
//  Created by User on 3/12/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

var roomnumber = 1
var guestnumber = 1
let ratesStr = ["None", "Rewards Points", "AAA/CAA", "Senior Discount", "Government & Military"]
var myIndex = 0

class optionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var guestLabel: UILabel!
    @IBOutlet weak var roomminus: UIButton!
    @IBOutlet weak var guestminus: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roomLabel.text = "\(roomnumber)"
        guestLabel.text = "\(guestnumber)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func roomplustapped(_ sender: Any) {
        if roomminus.isEnabled == false{
            roomminus.isEnabled = true
        }
        roomnumber += 1
        roomLabel.text = "\(roomnumber)"
    }
    
    @IBAction func roomminustapped(_ sender: Any) {
        if roomnumber > 1{
            roomnumber -= 1
            roomLabel.text = "\(roomnumber)"
        }else{
            roomminus.isEnabled = false
        }
    }
    
    @IBAction func guestplustapped(_ sender: Any) {
        if guestminus.isEnabled == false{
            guestminus.isEnabled = true
        }
        guestnumber += 1
        guestLabel.text = "\(guestnumber)"
    }
    
    @IBAction func guestminustapped(_ sender: Any) {
        if guestnumber > 1{
            guestnumber -= 1
            guestLabel.text = "\(guestnumber)"
        }else{
            guestminus.isEnabled = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ratesStr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = ratesStr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        myIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
    }
    
    @IBAction func confirmtapped(_ sender: Any) {
        print(myIndex)
        performSegue(withIdentifier: "confirm", sender: self)
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
