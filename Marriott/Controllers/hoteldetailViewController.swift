//
//  hoteldetailViewController.swift
//  Marriott
//
//  Created by User on 3/16/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

var roomname = ""
var memberrate = ""
var dailyprice = ""

class hoteldetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myscrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var datesBtn: UIButton!
    @IBOutlet weak var optionsBtn: UIButton!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    var imageArray = [UIImage]()
    let roomnameArray = ["Guest room, 2 Queen, Stadium OR City view", "Guest room, 1 King, Stadium OR City view"]
    let priceArray = ["254", "254"]
    let priceArray2 = ["259", "259"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageArray = [#imageLiteral(resourceName: "57428872.jpg"), #imageLiteral(resourceName: "56688272390e5601b0ace1e9.jpg"), #imageLiteral(resourceName: "oxrvb_main03.jpg"), #imageLiteral(resourceName: "cy_space_guest-room-06-lrg.jpg"), #imageLiteral(resourceName: "JW-Marriott-Mumbai-guestroom.jpg"), #imageLiteral(resourceName: "kglmc-guestroom-0036-hor-clsc.jpg"), #imageLiteral(resourceName: "153073093.jpg"), #imageLiteral(resourceName: "contemporary-bathroom.jpg"), #imageLiteral(resourceName: "delap_phototour18_w.jpg"), #imageLiteral(resourceName: "fradt_crossrestaurant_home.jpg")]
        
        
        for i in 0..<imageArray.count{
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: myscrollView.frame.width, height: myscrollView.frame.height)
                    
            myscrollView.contentSize.width = myscrollView.frame.width * CGFloat(i+1)
            myscrollView.addSubview(imageView)
        }
        myscrollView.isPagingEnabled = true
        nameLabel.text = hotelname
        addressLabel.text = address
        datesBtn.setTitle("\(datenumber)~\(enddatenumber)", for: .normal)
        optionsBtn.setTitle("\(roomnumber) ROOM, \(guestnumber) GUEST, \(ratesStr[myIndex])", for: .normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1{
            return roomnameArray.count
        }else{
            return roomnameArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! roomTableViewCell
            cell.roomnameLabel.text = roomnameArray[indexPath.row]
            cell.priceLabel.text = priceArray[indexPath.row]
            cell.roomdetailBtn.tag = indexPath.row
            cell.roomdetailBtn.addTarget(self, action: #selector(hoteldetailViewController.roombutton(sender:)), for: .touchUpInside)
            cell.ratedetailBtn.addTarget(self, action: #selector(hoteldetailViewController.ratesbutton(sender:)), for: .touchUpInside)
            cell.selectBtn.tag = indexPath.row
            cell.selectBtn.addTarget(self, action: #selector(hoteldetailViewController.selectbutton(sender:)), for: .touchUpInside)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! room2TableViewCell
            cell.roomnameLabel.text = roomnameArray[indexPath.row]
            cell.priceLabel.text = priceArray2[indexPath.row]
            cell.roomdetailBtn.tag = indexPath.row
            cell.roomdetailBtn.addTarget(self, action: #selector(hoteldetailViewController.roombutton2(sender:)), for: .touchUpInside)
            cell.ratedetailBtn.addTarget(self, action: #selector(hoteldetailViewController.ratesbutton(sender:)), for: .touchUpInside)
            cell.selectBtn.tag = indexPath.row
            cell.selectBtn.addTarget(self, action: #selector(hoteldetailViewController.selectbutton2(sender:)), for: .touchUpInside)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tableView1{
            return 157
        }else{
            return 157
        }
    }
    
    @objc func roombutton(sender:UIButton){
        roomname = roomnameArray[sender.tag]
        memberrate = "Marriott Rewards Member Rate"
        let popOverVC = UIStoryboard(name: "MarriottStoryboard", bundle: nil).instantiateViewController(withIdentifier: "room") as! RoomViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @objc func roombutton2(sender:UIButton){
        roomname = roomnameArray[sender.tag]
        memberrate = "Regular Rate"
        let popOverVC = UIStoryboard(name: "MarriottStoryboard", bundle: nil).instantiateViewController(withIdentifier: "room") as! RoomViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @objc func ratesbutton(sender:UIButton){
        let popOverVC = UIStoryboard(name: "MarriottStoryboard", bundle: nil).instantiateViewController(withIdentifier: "rates") as! ratesViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @objc func selectbutton(sender:UIButton){
        roomname = roomnameArray[sender.tag]
        memberrate = "Marriott Rewards Member Rate"
        dailyprice = priceArray[sender.tag]
        let popOverVC = UIStoryboard(name: "MarriottStoryboard", bundle: nil).instantiateViewController(withIdentifier: "confirmation") as! confirmationViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    @objc func selectbutton2(sender:UIButton){
        roomname = roomnameArray[sender.tag]
        memberrate = "Regular Rate"
        dailyprice = priceArray2[sender.tag]
        let popOverVC = UIStoryboard(name: "MarriottStoryboard", bundle: nil).instantiateViewController(withIdentifier: "confirmation") as! confirmationViewController
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
