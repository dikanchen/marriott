//
//  locationViewController.swift
//  Marriott
//
//  Created by User on 3/9/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import CoreData

let cityStr = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX", "Phoenix, AZ", "Philadelphia, PA", "San Antonio, TX", "San Diego, CA", "Dallas, TX", "San Jose, CA", "Austin, TX", "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Indianapolis, IN", "Fort Worth, TX", "Charlotte, NC", "Seattle, WA", "Denver, CO", "El Paso, TX", "Washington, DC", "Boston, MA", "Detroit, MI", "Nashville, TN", "Memphis, TN", "Portland, OR", "Oklahoma City, OK", "Las Vegas, NV", "Louisville, KY", "Baltimore, MD", "Milwaukee, WI", "Albuquerque, NM", "Tucson, AZ", "Fresno, CA", "Sacramento, CA", "Mesa, AZ", "Kansas City, MO", "Atlanta, GA", "Long Beach, CA", "Colorado Springs, CO", "Raleigh, NC", "Miami, FL", "Virginia Beach, VA", "Omaha, NE", "Oakland, CA", "Minneapolis, MN", "Tulsa, OK", "Arlington, TX", "New Orleans, LA", "Wichita, KS", "Cleveland, OH", "Tampa, FL", "Bakersfield, CA", "Aurora, CO", "Honolulu, HI", "Anaheim, CA", "Santa Ana, CA", "Corpus Christi, TX", "Riverside, CA", "Lexington, KY", "St. Louis, MO", "Stockton, CA", "Pittsburgh, PA", "Saint Paul, MN", "Cincinnati, OH", "Anchorage, AK", "Henderson, NV", "Greensboro, NC", "Plano, TX", "Newark, NJ", "Lincoln, NE", "Toledo, OH", "Orlando, FL", "Chula Vista, CA", "Irvine, CA", "Fort Wayne, IN", "Jersey City, NJ", "Durham, NC", "St. Petersburg, FL", "Laredo, TX", "Buffalo, NY", "Madison, WI", "Lubbock, TX", "Chandler, AZ", "Scottsdale, AZ", "Glendale, AZ", "Reno, NV", "Norfolk, VA", "Winston–Salem, NC", "North Las Vegas, NV", "Irving, TX", "Chesapeake, VA", "Gilbert, AZ", "Hialeah, FL", "Garland, TX", "Fremont, CA", "Baton Rouge, LA", "Richmond, VA", "Boise, ID", "San Bernardino, CA", "Spokane, WA", "Des Moines, IA", "Modesto, CA", "Birmingham, AL", "Tacoma, WA", "Fontana, CA", "Rochester, NY", "Oxnard, CA", "Moreno Valley, CA", "Fayetteville, NC", "Aurora, IL", "Glendale, CA", "Yonkers, NY", "Huntington Beach, CA", "Montgomery, AL", "Amarillo, TX", "Little Rock, AR", "Akron, OH", "Columbus, GA", "Augusta, GA", "Grand Rapids, MI", "Shreveport, LA", "Salt Lake City, UT", "Huntsville, AL", "Mobile, AL", "Tallahassee, FL", "Grand Prairie, TX", "Overland Park, KS", "Knoxville, TN", "Port St. Lucie, FL", "Worcester, MA", "Brownsville, TX", "Tempe, AZ", "Santa Clarita, CA", "Newport News, VA", "Cape Coral, FL", "Providence, RI", "Fort Lauderdale, FL", "Chattanooga, TN", "Rancho Cucamonga, CA", "Oceanside, CA", "Santa Rosa, CA", "Garden Grove, CA", "Vancouver, WA", "Sioux Falls, SD", "Ontario, CA", "McKinney, TX", "Elk Grove, CA", "Jackson, MS", "Pembroke Pines, FL", "Salem, OR", "Springfield, MO", "Corona, CA", "Eugene, OR", "Fort Collins, CO", "Peoria, AZ", "Frisco, TX", "Cary, NC", "Lancaster, PA", "Hayward, CA", "Palmdale, CA", "Salinas, CA", "Alexandria, VA", "Lakewood, CO", "Springfield, MA", "Pasadena, TX", "Sunnyvale, CA", "Macon, GA", "Pomona, CA", "Hollywood, FL", "Kansas City, KS", "Escondido, CA", "Clarksville, TN", "Joliet, IL", "Rockford, IL", "Torrance, CA", "Naperville, IL", "Paterson, NJ", "Savannah, GA", "Bridgeport, CT", "Mesquite, TX", "Killeen, TX", "Syracuse, NY", "McAllen, TX", "Pasadena, CA", "Bellevue, WA", "Fullerton, CA", "Orange, CA", "Dayton, OH", "Miramar, FL", "Thornton, CO", "West Valley City, UT", "Olathe, KS","Hampton, VA", "Warren, MI", "Midland, TX", "Waco, TX", "Charleston, SC", "Columbia, SC", "Denton, TX", "Carrollton, TX", "Surprise, AZ", "Roseville, CA","Sterling Heights, MI", "Murfreesboro, TN", "Gainesville, FL", "Cedar Rapids, IA", "Visalia, CA", "Coral Springs, FL", "New Haven, CT", "Stamford, CT", "Thousand Oaks, CA", "Concord, CA", "Elizabeth, NJ", "Lafayette, LA", "Kent, WA", "Topeka, KS", "Simi Valley, CA", "Santa Clara, CA", "Athens, GA", "Hartford, CT", "Victorville, CA", "Abilene, TX", "Norman, OK", "Berkeley, CA", "Round Rock, TX", "Ann Arbor, MI", "Fargo, ND", "Columbia, MO", "Allentown, PA", "Evansville, IN", "Beaumont, TX", "    Odessa, TX", "Wilmington, NC", "Arvada, CO", "Independence, MO", "Provo, UT", "Lansing, MI", "El Monte, CA", "Springfield, IL", "Fairfield, CA", "Clearwater, FL", "Peoria, IL", "Rochester, MN", "Carlsbad, CA", "Westminster, CO", "West Jordan, UT", "Pearland, TX", "Richardson, TX", "Downey, CA", "Miami Gardens, FL", "Temecula, CA", "Costa Mesa, CA", "College Station, TX", "Elgin, TX", "Murrieta, CA", "Gresham OR", "High Point, NC", "Antioch, CA", "Inglewood, CA", "Cambridge, MA", "Lowell, MA", "Manchester, NH", "Billings, MT", "Pueblo, CO", "Palm Bay, FL", "Centennial, CO", "Richmond, CA", "Ventura, CA", "Pompano Beach, FL", "North Charleston, SC", "Everett, WA", "Waterbury, CT", "West Palm Beach, FL", "Boulder, CO", "West Covina, CA", "Broken Arrow, OK", "Clovis, CA", "Daly City, CA", "Lakeland, FL", "Santa Maria, CA", "Norwalk, CA", "Sandy Springs, GA", "Hillsboro, OR", "Green Bay, WI", "Tyler, TX", "Wichita Falls, TX", "Lewisville, TX", "Burbank, CA", "Greeley, CO", "San Mateo, CA", "El Cajon, CA", "Jurupa Valley, CA", "Rialto, CA", "Davenport, IA", "League City, TX", "Edison, NJ", "Davie, FL", "Las Cruces, NM", "South Bend, IN", "Vista, CA", "Woodbridge, NJ", "Renton, WA", "Lakewood, NJ", "San Angelo, TX", "Clinton, MI"]

class locationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var currentArray = cityStr
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = currentArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityname = currentArray[indexPath.row]
        let newCity = NSEntityDescription.insertNewObject(forEntityName: "City", into: context)
        newCity.setValue(cityname, forKey: "cityname")
        do {
            try context.save()
        }catch{
            print(error)
        }
        performSegue(withIdentifier: "city", sender: self)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else{
            currentArray = cityStr
            return
        }
        currentArray = cityStr.filter({ (city) -> Bool in
            city.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.resignFirstResponder()
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
