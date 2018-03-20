//
//  BookViewController.swift
//  Marriott
//
//  Created by User on 3/7/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import Firebase

var urlStr:String = ""

class BookViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var nights: UILabel!
    
    let feature1 = ["title":"Earn up to 3,000 bonus points per stay", "button":"View Details >",  "image":"ws_Building_Prague_Czech_Republic_640x1136.jpg"]
    let feature2 = ["title":"Change payment method for an upcoming stay", "button":"My Reservations >",  "image":"allef-vinicius-241577-unsplash.jpg"]
    let feature3 = ["title":"Romance by-the-bay in San Francisco", "button":"Read More >",  "image":"spices_seasonings_red_pepper_black_pepper_pepper_star_anise_onion_ginger_garlic_walnuts_bay_leaf_78738_640x960.jpg"]
    let feature4 = ["title":"Book direct for our lowest price and instant benefits", "button":"Book Now >",  "image":"be319827c9728ffe4f055a844b4e69e8.jpg"]
    let feature5 = ["title":"75,000 Points. Must be a US resident", "button":"Learn More >",  "image":"Glass Apple Logo carved in Metal iPhone 5 Wallpaper-320x480.png"]
    let feature6 = ["title":"Your Perfect Travel Companion", "button":"",  "image":"Hammock Palm Trees Beach iPhone 6 Plus HD Wallpaper.jpg"]
    
    var featurearray = [Dictionary<String, String>]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nights.text = "\(sumnights) NIGHTS"
        

        // Do any additional setup after loading the view.
        
        featurearray = [feature1, feature2, feature3, feature4, feature5, feature6]
        
        mainScrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * CGFloat(featurearray.count))
        
        loadFeatures()
        
        checkIfUserLoggedIn()
    }
    
    func checkIfUserLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            perform(#selector(handlelogout), with: nil, afterDelay: 0)
        } else {
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                print(snapshot)
                if let dictionary = snapshot.value as? [String:AnyObject] {
                    DispatchQueue.main.async {
                        self.name.text = dictionary["First name"] as? String
                    }
                }
            }, withCancel: nil)
        }
    }
    
    @objc func handlelogout(){
        do{
            try Auth.auth().signOut()
        }catch let err{
            print(err)
        }
        
        let logincontroller = ViewController()
        present(logincontroller, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.title = "Done"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loadFeatures(){
        for(index, feature) in featurearray.enumerated(){
            if let featureView = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as? Slide {
                featureView.imageView.image = UIImage(named: feature["image"]!)
                featureView.introLabel.text = feature["title"]
                featureView.introBtn.setTitle(feature["button"], for: .normal)
                
                featureView.introBtn.tag = index
                featureView.introBtn.addTarget(self, action: #selector(BookViewController.tapbutton(sender:)), for: .touchUpInside)
                
                mainScrollView.addSubview(featureView)
                
                featureView.frame.size.height = self.view.bounds.size.height
                featureView.frame.size.width = self.view.bounds.size.width
                featureView.frame.origin.y = CGFloat(index) * self.view.bounds.size.height
            }
        }
    }
    
    @objc func tapbutton(sender:UIButton) {
        print(sender.tag)
        if sender.tag == 0{
            urlStr = "http://www.marriott.com/rewards/promotion.mi?promotion=MA18"
            performSegue(withIdentifier: "segue", sender: self)
        }else if sender.tag == 1{
            performSegue(withIdentifier: "history", sender: self)
        }else if sender.tag == 2{
            urlStr = "https://traveler.marriott.com/eat-and-drink/andrew-zimmern-in-nashville-when-in-tennessee-eat-squirrel/?inAppBrowser="
            performSegue(withIdentifier: "segue", sender: self)
        }else if sender.tag == 3{
            performSegue(withIdentifier: "booking", sender: self)
        }else if sender.tag == 4{
            urlStr = "https://creditcards.chase.com/a1/marriottpremier?CELL=6QHP&SPID=FNYX"
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func locationtapped(_ sender: Any) {
        performSegue(withIdentifier: "city", sender: self)
    }
    
    @IBAction func historytapped(_ sender: Any) {
        performSegue(withIdentifier: "history", sender: self)
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
