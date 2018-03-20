//
//  location1ViewController.swift
//  Marriott
//
//  Created by User on 3/10/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import CoreData

var cityname = "Where next?"

class location1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var optionsbtn: UIButton!
    @IBOutlet weak var specialratesbtn: UIButton!
    @IBOutlet weak var datesBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var cityArray:[City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationBtn.setTitle(cityname, for: .normal)
        optionsbtn.setTitle("\(roomnumber) ROOM, \(guestnumber) GUEST", for: .normal)
        specialratesbtn.setTitle(ratesStr[myIndex], for: .normal)
        if (datenumber != "" && enddatenumber != ""){
            datesBtn.setTitle("\(datenumber)~\(enddatenumber)", for: .normal)
        }
        
        self.fetchData()
        cityArray.reverse()
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func optionstapped(_ sender: Any) {
        performSegue(withIdentifier: "options", sender: self)
    }
    
    @IBAction func specialratestapped(_ sender: Any) {
        performSegue(withIdentifier: "options", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cityArray.count < 20{
            return cityArray.count
        }else{
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let city = cityArray[indexPath.row]
        cell.textLabel?.text = city.cityname!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityname = cityArray[indexPath.row].cityname!
        locationBtn.setTitle(cityname, for: .normal)
    }
    
    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            cityArray = try context.fetch(City.fetchRequest())
        }catch{
            print(error)
        }
    }
    
    @IBAction func searchtapped(_ sender: Any) {
        if(cityname != "Where next?" && datenumber != "" && enddatenumber != ""){
            performSegue(withIdentifier: "hotel", sender: self)
        }else{
            createAlert(title: "Warning", message: "Please make sure both location and dates are selected")
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
