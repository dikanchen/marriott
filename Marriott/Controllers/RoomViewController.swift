//
//  RoomViewController.swift
//  Marriott
//
//  Created by User on 3/17/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

class RoomViewController: UIViewController {

    @IBOutlet weak var hotelnameLabel: UILabel!
    @IBOutlet weak var memberrateLabel: UILabel!
    @IBOutlet weak var bedLabel: UILabel!
    @IBOutlet weak var occupancyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()
        
        hotelnameLabel.text = hotelname
        memberrateLabel.text = memberrate
        if roomname == "Guest room, 2 Queen, Stadium OR City view"{
            bedLabel.text = "2 Queen"
            occupancyLabel.text = "Maximum Occupancy: 4"
        }else{
            bedLabel.text = "1 King"
            occupancyLabel.text = "Maximum Occupancy: 3"
        }
        
        // Do any additional setup after loading the view.
    }
    @IBAction func closepopup(_ sender: Any) {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
