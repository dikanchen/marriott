//
//  HotelsViewController.swift
//  Marriott
//
//  Created by User on 3/13/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import CoreLocation

var citylatitude = ""
var citylongtitude = ""
var hotellatitude: Double?
var hotellongtitude: Double?
var address = ""
var hotelname = ""

struct locationresult{
    let lat:Double
    let lng:Double
    
    init(lat:Double, lng:Double) {
        self.lat = lat
        self.lng = lng
    }
}

class HotelsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var locationBtn: UIButton!
    @IBOutlet weak var optionsbtn: UIButton!
    @IBOutlet weak var specialratesbtn: UIButton!
    @IBOutlet weak var datesBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var hotelresult = [hotel]()
    var location = [locationresult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationBtn.setTitle(cityname, for: .normal)
        optionsbtn.setTitle("\(roomnumber) ROOM, \(guestnumber) GUEST", for: .normal)
        specialratesbtn.setTitle(ratesStr[myIndex], for: .normal)
        datesBtn.setTitle("\(datenumber)~\(enddatenumber)", for: .normal)

        // Do any additional setup after loading the view.
        
        switch cityname{
        case "New York, NY":
            citylatitude = "40.7128"
            citylongtitude = "-74.0060"
        case "Los Angeles, CA":
            citylatitude = "34.0522"
            citylongtitude = "-118.2437"
        case "Chicago, IL":
            citylatitude = "41.8781"
            citylongtitude = "-87.6298"
        case "Houston, TX":
            citylatitude = "29.7604"
            citylongtitude = "-95.3698"
        case "Phoenix, AZ":
            citylatitude = "33.4484"
            citylongtitude = "-112.0740"
        case "Philadelphia, PA":
            citylatitude = "39.9526"
            citylongtitude = "-75.1652"
        case "San Antonio, TX":
            citylatitude = "29.4241"
            citylongtitude = "-98.4936"
        case "San Diego, CA":
            citylatitude = "32.7157"
            citylongtitude = "-117.1611"
        case "Dallas, TX":
            citylatitude = "32.7791"
            citylongtitude = "-96.8003"
        case "San Jose, CA":
            citylatitude = "37.3382"
            citylongtitude = "-121.8863"
        case "Austin, TX":
            citylatitude = "30.2729"
            citylongtitude = "-97.7444"
        case "Jacksonville, FL":
            citylatitude = "30.3276"
            citylongtitude = "-81.6556"
        case "San Francisco, CA":
            citylatitude = "37.7749"
            citylongtitude = "-122.4194"
        case "Columbus, OH":
            citylatitude = "39.9612"
            citylongtitude = "-82.9988"
        case "Indianapolis, IN":
            citylatitude = "39.7684"
            citylongtitude = "-86.1581"
        case "Fort Worth, TX":
            citylatitude = "32.7555"
            citylongtitude = "-97.3308"
        case "Charlotte, NC":
            citylatitude = "35.2271"
            citylongtitude = "-80.8431"
        case "Seattle, WA":
            citylatitude = "47.6062"
            citylongtitude = "-122.3321"
        case "Denver, CO":
            citylatitude = "39.7392"
            citylongtitude = "-104.9903"
        case "El Paso, TX":
            citylatitude = "31.7619"
            citylongtitude = "-106.4850"
        case "Washington, DC":
            citylatitude = "38.9072"
            citylongtitude = "-77.0369"
        case "Boston, MA":
            citylatitude = "42.3601"
            citylongtitude = "-71.0589"
        case "Detroit, MI":
            citylatitude = "42.3314"
            citylongtitude = "-83.0458"
        case "Nashville, TN":
            citylatitude = "36.1627"
            citylongtitude = "-86.7816"
        case "Memphis, TN":
            citylatitude = "35.1495"
            citylongtitude = "-90.0490"
        case "Portland, OR":
            citylatitude = "45.5231"
            citylongtitude = "-122.6765"
        case "Oklahoma City, OK":
            citylatitude = "35.4676"
            citylongtitude = "-97.5164"
        case "Las Vegas, NV":
            citylatitude = "36.1671"
            citylongtitude = "-115.1356"
        case "Louisville, KY":
            citylatitude = "38.2527"
            citylongtitude = "-85.7585"
        case "Baltimore, MD":
            citylatitude = "39.2904"
            citylongtitude = "-76.6122"
        case "Milwaukee, WI":
            citylatitude = "43.0389"
            citylongtitude = "-87.9065"
        case "Albuquerque, NM":
            citylatitude = "35.0853"
            citylongtitude = "-106.6056"
        case "Tucson, AZ":
            citylatitude = "32.2217"
            citylongtitude = "-110.9265"
        case "Fresno, CA":
            citylatitude = "36.7468"
            citylongtitude = "-119.7726"
        case "Sacramento, CA":
            citylatitude = "38.5816"
            citylongtitude = "-121.4944"
        case "Mesa, AZ":
            citylatitude = "33.4152"
            citylongtitude = "-111.8315"
        case "Kansas City, MO":
            citylatitude = "39.0997"
            citylongtitude = "-94.5786"
        case "Atlanta, GA":
            citylatitude = "33.7490"
            citylongtitude = "-84.3880"
        case "Long Beach, CA":
            citylatitude = "33.7701"
            citylongtitude = "-118.1937"
        case "Colorado Springs, CO":
            citylatitude = "38.8339"
            citylongtitude = "-104.8214"
        case "Raleigh, NC":
            citylatitude = "35.7796"
            citylongtitude = "-78.6382"
        case "Miami, FL":
            citylatitude = "25.7617"
            citylongtitude = "-80.1918"
        case "Virginia Beach, VA":
            citylatitude = "36.8529"
            citylongtitude = "-75.9780"
        case "Omaha, NE":
            citylatitude = "41.2524"
            citylongtitude = "-95.9980"
        case "Oakland, CA":
            citylatitude = "37.8044"
            citylongtitude = "-122.2711"
        case "Minneapolis, MN":
            citylatitude = "44.9778"
            citylongtitude = "-93.2650"
        case "Tulsa, OK":
            citylatitude = "36.1540"
            citylongtitude = "-95.9928"
        case "Arlington, TX":
            citylatitude = "32.7357"
            citylongtitude = "-97.1081"
        case "New Orleans, LA":
            citylatitude = "29.9511"
            citylongtitude = "-90.0715"
        case "Wichita, KS":
            citylatitude = "37.6872"
            citylongtitude = "-97.3301"
        case "Cleveland, OH":
            citylatitude = "41.4993"
            citylongtitude = "-81.6944"
        case "Tampa, FL":
            citylatitude = "27.9506"
            citylongtitude = "-82.4572"
        case "Bakersfield, CA":
            citylatitude = "35.3733"
            citylongtitude = "-119.0187"
        case "Aurora, CO":
            citylatitude = "39.7294"
            citylongtitude = "-104.8319"
        case "Honolulu, HI":
            citylatitude = "21.3069"
            citylongtitude = "-157.8583"
        case "Anaheim, CA":
            citylatitude = "33.8366"
            citylongtitude = "-117.9143"
        case "Santa Ana, CA":
            citylatitude = "33.7455"
            citylongtitude = "-117.8677"
        case "Corpus Christi, TX":
            citylatitude = "27.8006"
            citylongtitude = "-97.3964"
        case "Riverside, CA":
            citylatitude = "33.9533"
            citylongtitude = "-117.3962"
        case "Lexington, KY":
            citylatitude = "38.0406"
            citylongtitude = "-84.5037"
        case "St. Louis, MO":
            citylatitude = "38.6270"
            citylongtitude = "-90.1994"
        case "Stockton, CA":
            citylatitude = "37.9577"
            citylongtitude = "121.2908"
        case "Pittsburgh, PA":
            citylatitude = "40.4406"
            citylongtitude = "-79.9959"
        case "Saint Paul, MN":
            citylatitude = "44.9537"
            citylongtitude = "-93.0900"
        case "Cincinnati, OH":
            citylatitude = "39.1031"
            citylongtitude = "-84.5120"
        case "Anchorage, AK":
            citylatitude = "61.2181"
            citylongtitude = "-149.9003"
        case "Henderson, NV":
            citylatitude = "36.0395"
            citylongtitude = "-114.9817"
        case "Greensboro, NC":
            citylatitude = "36.0726"
            citylongtitude = "-79.7920"
        case "Plano, TX":
            citylatitude = "33.0198"
            citylongtitude = "-96.6989"
        case "Newark, NJ":
            citylatitude = "40.7357"
            citylongtitude = "-74.1724"
        case "Lincoln, NE":
            citylatitude = "40.8258"
            citylongtitude = "-96.6852"
        case "Toledo, OH":
            citylatitude = "41.6528"
            citylongtitude = "-83.5379"
        case "Orlando, FL":
            citylatitude = "28.5383"
            citylongtitude = "-81.3792"
        case "Chula Vista, CA":
            citylatitude = "32.6401"
            citylongtitude = "-117.0842"
        case "Irvine, CA":
            citylatitude = "33.6846"
            citylongtitude = "-117.8265"
        case "Fort Wayne, IN":
            citylatitude = "41.0793"
            citylongtitude = "-85.1394"
        case "Jersey City, NJ":
            citylatitude = "40.7282"
            citylongtitude = "-74.0776"
        case "Durham, NC":
            citylatitude = "35.9940"
            citylongtitude = "-78.8986"
        case "St. Petersburg, FL":
            citylatitude = "27.7676"
            citylongtitude = "-82.6403"
        case "Laredo, TX":
            citylatitude = "27.5306"
            citylongtitude = "-99.4803"
        case "Buffalo, NY":
            citylatitude = "42.8864"
            citylongtitude = "-78.8784"
        case "Madison, WI":
            citylatitude = "43.0731"
            citylongtitude = "-89.4012"
        case "Lubbock, TX":
            citylatitude = "33.5779"
            citylongtitude = "-101.8552"
        case "Chandler, AZ":
            citylatitude = "33.3062"
            citylongtitude = "-111.8413"
        case "Scottsdale, AZ":
            citylatitude = "33.4942"
            citylongtitude = "-111.9261"
        case "Glendale, AZ":
            citylatitude = "33.5387"
            citylongtitude = "-112.1860"
        case "Reno, NV":
            citylatitude = "39.5296"
            citylongtitude = "-119.8138"
        case "Norfolk, VA":
            citylatitude = "36.8508"
            citylongtitude = "-76.2859"
        case "Winston–Salem, NC":
            citylatitude = "36.0999"
            citylongtitude = "-80.2442"
        case "North Las Vegas, NV":
            citylatitude = "36.1989"
            citylongtitude = "-115.1175"
        case "Irving, TX":
            citylatitude = "32.8140"
            citylongtitude = "-96.9489"
        case "Chesapeake, VA":
            citylatitude = "36.7682"
            citylongtitude = "-76.2875"
        case "Gilbert, AZ":
            citylatitude = "33.3528"
            citylongtitude = "-111.7890"
        case "Hialeah, FL":
            citylatitude = "25.8576"
            citylongtitude = "-80.2781"
        case "Garland, TX":
            citylatitude = "32.9126"
            citylongtitude = "-96.6389"
        case "Fremont, CA":
            citylatitude = "37.5483"
            citylongtitude = "-121.9886"
        case "Baton Rouge, LA":
            citylatitude = "30.4583"
            citylongtitude = "-91.1403"
        case "Richmond, VA":
            citylatitude = "37.5407"
            citylongtitude = "-77.4360"
        case "Boise, ID":
            citylatitude = "43.6187"
            citylongtitude = "-116.2146"
        case "San Bernardino, CA":
            citylatitude = "34.1083"
            citylongtitude = "-117.2898"
        case "Spokane, WA":
            citylatitude = "47.6588"
            citylongtitude = "-117.4260"
        case "Des Moines, IA":
            citylatitude = "41.6005"
            citylongtitude = "-93.6091"
        case "Modesto, CA":
            citylatitude = "37.6391"
            citylongtitude = "-120.9969"
        case "Birmingham, AL":
            citylatitude = "33.5207"
            citylongtitude = "-86.8025"
        case "Tacoma, WA":
            citylatitude = "47.2529"
            citylongtitude = "-122.4443"
        case "Fontana, CA":
            citylatitude = "34.0922"
            citylongtitude = "-117.4350"
        case "Rochester, NY":
            citylatitude = "43.1610"
            citylongtitude = "-77.6109"
        case "Oxnard, CA":
            citylatitude = "34.1975"
            citylongtitude = "-119.1771"
        case "Moreno Valley, CA":
            citylatitude = "33.9425"
            citylongtitude = "-117.2297"
        case "Fayetteville, NC":
            citylatitude = "35.0527"
            citylongtitude = "-78.8784"
        case "Aurora, IL":
            citylatitude = "41.7606"
            citylongtitude = "-88.3201"
        case "Glendale, CA":
            citylatitude = "34.1425"
            citylongtitude = "-34.1425"
        case "Yonkers, NY":
            citylatitude = "40.9312"
            citylongtitude = "-73.8987"
        case "Huntington Beach, CA":
            citylatitude = "33.6595"
            citylongtitude = "-117.9988"
        case "Montgomery, AL":
            citylatitude = "32.3668"
            citylongtitude = "-86.3000"
        case "Amarillo, TX":
            citylatitude = "35.2220"
            citylongtitude = "-101.8313"
        case "Little Rock, AR":
            citylatitude = "34.7465"
            citylongtitude = "-92.2896"
        case "Akron, OH":
            citylatitude = "41.0814"
            citylongtitude = "-81.5190"
        case "Columbus, GA":
            citylatitude = "32.4610"
            citylongtitude = "-84.9877"
        case "Augusta, GA":
            citylatitude = "33.4735"
            citylongtitude = "-82.0105"
        case "Grand Rapids, MI":
            citylatitude = "42.9634"
            citylongtitude = "-85.6681"
        case "Shreveport, LA":
            citylatitude = "32.5252"
            citylongtitude = "-93.7502"
        case "Salt Lake City, UT":
            citylatitude = "40.7608"
            citylongtitude = "-111.8910"
        case "Huntsville, AL":
            citylatitude = "34.7304"
            citylongtitude = "-86.5861"
        case "Mobile, AL":
            citylatitude = "30.6954"
            citylongtitude = "-88.0399"
        case "Tallahassee, FL":
            citylatitude = "30.4383"
            citylongtitude = "-84.2807"
        case "Grand Prairie, TX":
            citylatitude = "32.7460"
            citylongtitude = "-96.9978"
        case "Overland Park, KS":
            citylatitude = "38.9822"
            citylongtitude = "-94.6708"
        case "Knoxville, TN":
            citylatitude = "35.9606"
            citylongtitude = "-83.9207"
        case "Port St. Lucie, FL":
            citylatitude = "27.2730"
            citylongtitude = "-80.3582"
        case "Worcester, MA":
            citylatitude = "42.2626"
            citylongtitude = "-71.8023"
        case "Brownsville, TX":
            citylatitude = "25.9017"
            citylongtitude = "-97.4975"
        case "Tempe, AZ":
            citylatitude = "33.4255"
            citylongtitude = "-111.9400"
        case "Santa Clarita, CA":
            citylatitude = "34.3917"
            citylongtitude = "-118.5426"
        case "Newport News, VA":
            citylatitude = "37.0871"
            citylongtitude = "-76.4730"
        case "Cape Coral, FL":
            citylatitude = "26.5629"
            citylongtitude = "-81.9495"
        case "Providence, RI":
            citylatitude = "41.8240"
            citylongtitude = "-71.4128"
        case "Fort Lauderdale, FL":
            citylatitude = "26.1224"
            citylongtitude = "-80.1373"
        case "Chattanooga, TN":
            citylatitude = "35.0456"
            citylongtitude = "-85.3097"
        case "Rancho Cucamonga, CA":
            citylatitude = "34.1064"
            citylongtitude = "-117.5931"
        case "Oceanside, CA":
            citylatitude = "33.1959"
            citylongtitude = "-117.3795"
        case "Santa Rosa, CA":
            citylatitude = "38.4404"
            citylongtitude = "-122.7141"
        case "Garden Grove, CA":
            citylatitude = "33.7743"
            citylongtitude = "-117.9380"
        case "Vancouver, WA":
            citylatitude = "45.6318"
            citylongtitude = "-122.6716"
        case "Sioux Falls, SD":
            citylatitude = "43.5446"
            citylongtitude = "-96.7311"
        case "Ontario, CA":
            citylatitude = "34.0633"
            citylongtitude = "-117.6509"
        case "McKinney, TX":
            citylatitude = "33.1972"
            citylongtitude = "-96.6398"
        case "Elk Grove, CA":
            citylatitude = "38.4088"
            citylongtitude = "-121.3716"
        case "Jackson, MS":
            citylatitude = "32.2988"
            citylongtitude = "-90.1848"
        case "Pembroke Pines, FL":
            citylatitude = "26.0078"
            citylongtitude = "-80.2963"
        case "Salem, OR":
            citylatitude = "44.9440"
            citylongtitude = "-123.0340"
        case "Springfield, MO":
            citylatitude = "37.2090"
            citylongtitude = "-93.2923"
        case "Corona, CA":
            citylatitude = "33.8753"
            citylongtitude = "-117.5664"
        case "Eugene, OR":
            citylatitude = "44.0521"
            citylongtitude = "-123.0868"
        case "Fort Collins, CO":
            citylatitude = "40.5853"
            citylongtitude = "-105.0844"
        case "Peoria, AZ":
            citylatitude = "33.5806"
            citylongtitude = "-112.2374"
        case "Frisco, TX":
            citylatitude = "33.1507"
            citylongtitude = "-96.8236"
        case "Cary, NC":
            citylatitude = "35.7915"
            citylongtitude = "-78.7811"
        case "Lancaster, PA":
            citylatitude = "40.0379"
            citylongtitude = "-76.3055"
        case "Hayward, CA":
            citylatitude = "37.6688"
            citylongtitude = "-122.0808"
        case "Palmdale, CA":
            citylatitude = "34.5794"
            citylongtitude = "-118.1165"
        case "Salinas, CA":
            citylatitude = "36.6777"
            citylongtitude = "-121.6555"
        case "Alexandria, VA":
            citylatitude = "38.8048"
            citylongtitude = "-77.0469"
        case "Lakewood, CO":
            citylatitude = "39.7047"
            citylongtitude = "-105.0814"
        case "Springfield, MA":
            citylatitude = "42.1015"
            citylongtitude = "-72.5898"
        case "Pasadena, TX":
            citylatitude = "29.6911"
            citylongtitude = "-95.2091"
        case "Sunnyvale, CA":
            citylatitude = "37.3688"
            citylongtitude = "-122.0363"
        case "Macon, GA":
            citylatitude = "32.8407"
            citylongtitude = "-83.6324"
        case "Pomona, CA":
            citylatitude = "34.0551"
            citylongtitude = "-117.7500"
        case "Hollywood, FL":
            citylatitude = "26.0112"
            citylongtitude = "-80.1495"
        case "Kansas City, KS":
            citylatitude = "39.1145"
            citylongtitude = "-94.6271"
        case "Escondido, CA":
            citylatitude = "33.1192"
            citylongtitude = "-117.0864"
        case "Clarksville, TN":
            citylatitude = "36.5298"
            citylongtitude = "-87.3595"
        case "Joliet, IL":
            citylatitude = "41.5250"
            citylongtitude = "-88.0817"
        case "Rockford, IL":
            citylatitude = "42.2711"
            citylongtitude = "-89.0940"
        case "Torrance, CA":
            citylatitude = "33.8358"
            citylongtitude = "-118.3406"
        case "Naperville, IL":
            citylatitude = "41.7508"
            citylongtitude = "-88.1535"
        case "Paterson, NJ":
            citylatitude = "40.9168"
            citylongtitude = "-74.1718"
        case "Savannah, GA":
            citylatitude = "32.0835"
            citylongtitude = "-81.0998"
        case "Bridgeport, CT":
            citylatitude = "41.1865"
            citylongtitude = "-73.1952"
        case "Mesquite, TX":
            citylatitude = "32.7668"
            citylongtitude = "-96.5992"
        case "Killeen, TX":
            citylatitude = "31.1171"
            citylongtitude = "-97.7278"
        case "Syracuse, NY":
            citylatitude = "43.0481"
            citylongtitude = "-76.1474"
        case "McAllen, TX":
            citylatitude = "26.2034"
            citylongtitude = "-98.2300"
        case "Pasadena, CA":
            citylatitude = "34.1478"
            citylongtitude = "-118.1445"
        case "Bellevue, WA":
            citylatitude = "47.6101"
            citylongtitude = "-122.2015"
        case "Fullerton, CA":
            citylatitude = "33.8704"
            citylongtitude = "-117.9242"
        case "Orange, CA":
            citylatitude = "33.7879"
            citylongtitude = "-117.8531"
        case "Dayton, OH":
            citylatitude = "39.7589"
            citylongtitude = "-84.1916"
        case "Miramar, FL":
            citylatitude = "25.9861"
            citylongtitude = "-80.3036"
        case "Thornton, CO":
            citylatitude = "39.8680"
            citylongtitude = "-104.9719"
        case "West Valley City, UT":
            citylatitude = "40.6916"
            citylongtitude = "-112.0011"
        case "Olathe, KS":
            citylatitude = "38.8814"
            citylongtitude = "-94.8191"
        case "Hampton, VA":
            citylatitude = "37.0299"
            citylongtitude = "-76.3452"
        case "Warren, MI":
            citylatitude = "42.5145"
            citylongtitude = "-83.0147"
        case "Midland, TX":
            citylatitude = "31.9973"
            citylongtitude = "-102.0779"
        case "Waco, TX":
            citylatitude = "31.5493"
            citylongtitude = "-97.1467"
        case "Charleston, SC":
            citylatitude = "32.7765"
            citylongtitude = "-79.9311"
        case "Columbia, SC":
            citylatitude = "34.0007"
            citylongtitude = "-81.0348"
        case "Denton, TX":
            citylatitude = "33.2148"
            citylongtitude = "-97.1331"
        case "Carrollton, TX":
            citylatitude = "32.9756"
            citylongtitude = "-96.8900"
        case "Surprise, AZ":
            citylatitude = "33.6292"
            citylongtitude = "-112.3679"
        case "Roseville, CA":
            citylatitude = "38.7521"
            citylongtitude = "-121.2880"
        case "Sterling Heights, MI":
            citylatitude = "42.5803"
            citylongtitude = "-83.0302"
        case "Murfreesboro, TN":
            citylatitude = "35.8456"
            citylongtitude = "-86.3903"
        case "Gainesville, FL":
            citylatitude = "29.6516"
            citylongtitude = "-82.3248"
        case "Cedar Rapids, IA":
            citylatitude = "41.9779"
            citylongtitude = "-91.6656"
        case "Visalia, CA":
            citylatitude = "36.3302"
            citylongtitude = "-119.2921"
        case "Coral Springs, FL":
            citylatitude = "26.2712"
            citylongtitude = "-80.2706"
        case "New Haven, CT":
            citylatitude = "41.3083"
            citylongtitude = "-72.9279"
        case "Stamford, CT":
            citylatitude = "41.0534"
            citylongtitude = "-73.5387"
        case "Thousand Oaks, CA":
            citylatitude = "34.1706"
            citylongtitude = "-118.8376"
        case "Concord, CA":
            citylatitude = "‎37.9891"
            citylongtitude = "-‎122.0437"
        case "Elizabeth, NJ":
            citylatitude = "40.6640"
            citylongtitude = "-74.2107"
        case "Lafayette, LA":
            citylatitude = "30.2241"
            citylongtitude = "-92.0198"
        case "Kent, WA":
            citylatitude = "47.3809"
            citylongtitude = "-122.2348"
        case "Topeka, KS":
            citylatitude = "39.0558"
            citylongtitude = "-95.6890"
        case "Simi Valley, CA":
            citylatitude = "34.2694"
            citylongtitude = "-118.7815"
        case "Santa Clara, CA":
            citylatitude = "37.3541"
            citylongtitude = "-121.9552"
        case "Athens, GA":
            citylatitude = "33.9519"
            citylongtitude = "-83.3576"
        case "Hartford, CT":
            citylatitude = "41.7637"
            citylongtitude = "-72.6851"
        case "Victorville, CA":
            citylatitude = "34.5362"
            citylongtitude = "-117.2928"
        case "Abilene, TX":
            citylatitude = "32.4487"
            citylongtitude = "-99.7331"
        case "Norman, OK":
            citylatitude = "35.2226"
            citylongtitude = "-97.4395"
        case "Berkeley, CA":
            citylatitude = "37.8716"
            citylongtitude = "-122.2727"
        case "Round Rock, TX":
            citylatitude = "30.5083"
            citylongtitude = "-97.6789"
        case "Ann Arbor, MI":
            citylatitude = "42.2808"
            citylongtitude = "-83.7430"
        case "Fargo, ND":
            citylatitude = "46.8772"
            citylongtitude = "-96.7898"
        case "Columbia, MO":
            citylatitude = "38.9517"
            citylongtitude = "-92.3341"
        case "Allentown, PA":
            citylatitude = "40.6084"
            citylongtitude = "-75.4902"
        case "Evansville, IN":
            citylatitude = "37.9716"
            citylongtitude = "-87.5711"
        case "Beaumont, TX":
            citylatitude = "30.0802"
            citylongtitude = "-94.1266"
        case "Odessa, TX":
            citylatitude = "31.8457"
            citylongtitude = "-102.3676"
        case "Wilmington, NC":
            citylatitude = "34.2257"
            citylongtitude = "-77.9447"
        case "Arvada, CO":
            citylatitude = "39.8028"
            citylongtitude = "-105.0875"
        case "Independence, MO":
            citylatitude = "39.0911"
            citylongtitude = "-94.4155"
        case "Provo, UT":
            citylatitude = "40.2338"
            citylongtitude = "-111.6585"
        case "Lansing, MI":
            citylatitude = "42.7325"
            citylongtitude = "-84.5555"
        case "El Monte, CA":
            citylatitude = "34.0686"
            citylongtitude = "-118.0276"
        case "Springfield, IL":
            citylatitude = "39.7817"
            citylongtitude = "-89.6501"
        case "Fairfield, CA":
            citylatitude = "38.2494"
            citylongtitude = "-122.0400"
        case "Clearwater, FL":
            citylatitude = "27.9659"
            citylongtitude = "-82.8001"
        case "Peoria, IL":
            citylatitude = "40.6936"
            citylongtitude = "-89.5890"
        case "Rochester, MN":
            citylatitude = "44.0121"
            citylongtitude = "-92.4802"
        case "Carlsbad, CA":
            citylatitude = "33.1581"
            citylongtitude = "-117.3506"
        case "Westminster, CO":
            citylatitude = "39.8367"
            citylongtitude = "-105.0372"
        case "West Jordan, UT":
            citylatitude = "40.6097"
            citylongtitude = "-111.9391"
        case "Pearland, TX":
            citylatitude = "29.5636"
            citylongtitude = "-95.2860"
        case "Richardson, TX":
            citylatitude = "32.9483"
            citylongtitude = "-96.7299"
        case "Downey, CA":
            citylatitude = "33.9401"
            citylongtitude = "-118.1332"
        case "Miami Gardens, FL":
            citylatitude = "25.9420"
            citylongtitude = "-80.2456"
        case "Temecula, CA":
            citylatitude = "33.4936"
            citylongtitude = "-117.1484"
        case "Costa Mesa, CA":
            citylatitude = "33.6412"
            citylongtitude = "-117.9188"
        case "College Station, TX":
            citylatitude = "30.6280"
            citylongtitude = "-96.3344"
        case "Elgin, TX":
            citylatitude = "30.3497"
            citylongtitude = "-97.3703"
        case "Murrieta, CA":
            citylatitude = "33.5539"
            citylongtitude = "-117.2139"
        case "Gresham OR":
            citylatitude = "45.5056"
            citylongtitude = "-122.4479"
        case "High Point, NC":
            citylatitude = "35.9557"
            citylongtitude = "-80.0053"
        case "Antioch, CA":
            citylatitude = "38.0049"
            citylongtitude = "-121.8058"
        case "Inglewood, CA":
            citylatitude = "33.9617"
            citylongtitude = "-118.3531"
        case "Cambridge, MA":
            citylatitude = "42.3736"
            citylongtitude = "-71.1097°"
        case "Lowell, MA":
            citylatitude = "42.6334"
            citylongtitude = "-71.3162"
        case "Manchester, NH":
            citylatitude = "42.9956"
            citylongtitude = "-71.4548"
        case "Billings, MT":
            citylatitude = "45.7833"
            citylongtitude = "-108.5007"
        case "Pueblo, CO":
            citylatitude = "38.2544"
            citylongtitude = "-104.6091"
        case "Palm Bay, FL":
            citylatitude = "28.0345"
            citylongtitude = "-80.5887"
        case "Centennial, CO":
            citylatitude = "39.5807"
            citylongtitude = "-104.8772"
        case "Richmond, CA":
            citylatitude = "37.9368"
            citylongtitude = "-122.3473"
        case "Ventura, CA":
            citylatitude = "34.2803"
            citylongtitude = "-119.2947"
        case "Pompano Beach, FL":
            citylatitude = "26.2379"
            citylongtitude = "-80.1248"
        case "North Charleston, SC":
            citylatitude = "32.8546"
            citylongtitude = "-79.9748"
        case "Everett, WA":
            citylatitude = "47.9790"
            citylongtitude = "-122.2021"
        case "Waterbury, CT":
            citylatitude = "41.5582"
            citylongtitude = "-73.0515"
        case "West Palm Beach, FL":
            citylatitude = "26.7153"
            citylongtitude = "-80.0534"
        case "Boulder, CO":
            citylatitude = "40.0150"
            citylongtitude = "-105.2705"
        case "West Covina, CA":
            citylatitude = "34.0686"
            citylongtitude = "-117.9390"
        case "Broken Arrow, OK":
            citylatitude = "36.0609"
            citylongtitude = "-95.7975"
        case "Clovis, CA":
            citylatitude = "36.8252"
            citylongtitude = "-119.7029"
        case "Daly City, CA":
            citylatitude = "37.6879"
            citylongtitude = "-122.4702"
        case "Lakeland, FL":
            citylatitude = "28.0395"
            citylongtitude = "-81.9498"
        case "Santa Maria, CA":
            citylatitude = "34.9530"
            citylongtitude = "-120.4357"
        case "Norwalk, CA":
            citylatitude = "33.9025"
            citylongtitude = "-118.0819"
        case "Sandy Springs, GA":
            citylatitude = "33.9304"
            citylongtitude = "-84.3733"
        case "Hillsboro, OR":
            citylatitude = "45.5229"
            citylongtitude = "-122.9898"
        case "Green Bay, WI":
            citylatitude = "44.5192"
            citylongtitude = "-88.0198"
        case "Tyler, TX":
            citylatitude = "32.3513"
            citylongtitude = "-95.3011"
        case "Wichita Falls, TX":
            citylatitude = "33.9137"
            citylongtitude = "-98.4934"
        case "Lewisville, TX":
            citylatitude = "33.0462"
            citylongtitude = "-96.9942"
        case "Burbank, CA":
            citylatitude = "34.1808"
            citylongtitude = "-118.3090"
        case "Greeley, CO":
            citylatitude = "40.4233"
            citylongtitude = "-104.7091"
        case "San Mateo, CA":
            citylatitude = "37.5630"
            citylongtitude = "-122.3255"
        case "El Cajon, CA":
            citylatitude = "32.7948"
            citylongtitude = "-116.9625"
        case "Jurupa Valley, CA":
            citylatitude = "33.9972"
            citylongtitude = "-117.4855"
        case "Rialto, CA":
            citylatitude = "34.1064"
            citylongtitude = "-117.3703"
        case "Davenport, IA":
            citylatitude = "41.5236"
            citylongtitude = "-90.5776"
        case "League City, TX":
            citylatitude = "29.5075"
            citylongtitude = "-95.0949"
        case "Edison, NJ":
            citylatitude = "40.5187"
            citylongtitude = "-74.4121"
        case "Davie, FL":
            citylatitude = "26.0765"
            citylongtitude = "-80.2521"
        case "Las Cruces, NM":
            citylatitude = "32.3199"
            citylongtitude = "-106.7637"
        case "South Bend, IN":
            citylatitude = "41.6764"
            citylongtitude = "-86.2520"
        case "Vista, CA":
            citylatitude = "33.2002"
            citylongtitude = "-117.2424"
        case "Woodbridge, NJ":
            citylatitude = "40.5576"
            citylongtitude = "-74.2843"
        case "Renton, WA":
            citylatitude = "47.4829"
            citylongtitude = "-122.2171"
        case "Lakewood, NJ":
            citylatitude = "40.0821"
            citylongtitude = "-74.2097"
        case "San Angelo, TX":
            citylatitude = "31.4638"
            citylongtitude = "-100.4370"
        default:
            citylatitude = "42.0720"
            citylongtitude = "-83.9716"
        }
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(citylatitude),\(citylongtitude)&radius=50000&keyword=marriott&key=AIzaSyCwEcoS7lLjeO1_t0dBDVixEpc4zFnM8uM")
        URLSession.shared.dataTask(with: url!){data, response, error in
            guard let data = data, error == nil, response != nil else{return}
            do{
                let decoder = JSONDecoder()
                let downloadedresults = try decoder.decode(Results.self, from: data)
                self.hotelresult = downloadedresults.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                guard let json = try
                    JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? NSDictionary else {return}
                guard let dictionary = json as? [String:Any] else{return}
                guard let result = dictionary["results"] as? [[String:Any]] else {return}
                let hotellocation:[locationresult] = result.flatMap{
                    guard let geometry = $0["geometry"] as? NSDictionary else {return nil}
                    guard let location = geometry["location"] as? NSDictionary else {return nil}
                    guard let lat = location["lat"] as? Double else {return nil}
                    guard let lng = location["lng"] as? Double else {return nil}
                    //print(latitude)
                    //print(longtitude)
                    return locationresult(lat:lat, lng:lng)
                }
                self.location = hotellocation
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print(error)
            }
        }.resume()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = hotelresult[indexPath.row].name
        let location1 = CLLocation(latitude: Double(citylatitude)!, longitude: Double(citylongtitude)!)
        let location2 = CLLocation(latitude: location[indexPath.row].lat, longitude: location[indexPath.row].lng)
        let distance = location1.distance(from: location2) / 1609
        cell.distanceLabel.text = "Distance to City Center: \(String(format: "%.2f", distance)) miles"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        hotellatitude = location[indexPath.row].lat
        hotellongtitude = location[indexPath.row].lng
        address = hotelresult[indexPath.row].vicinity
        hotelname = hotelresult[indexPath.row].name
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
