//
//  hotelmapViewController.swift
//  Marriott
//
//  Created by User on 3/16/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import GoogleMaps

class hotelmapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let camera = GMSCameraPosition.camera(withLatitude: hotellatitude!, longitude: hotellongtitude!, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(hotellatitude!, hotellongtitude!)
        let marker = GMSMarker(position: currentLocation)
        marker.title = hotelname
        marker.snippet = address
        marker.map = mapView
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
