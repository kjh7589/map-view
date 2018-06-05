//
//  ViewController.swift
//  map view
//
//  Created by D7703_25 on 2018. 6. 5..
//  Copyright © 2018년 D7703_25. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var myMapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let center = CLLocationCoordinate2D(latitude:35.166016, longitude:129.072564)
        
        let loc01 = CLLocationCoordinate2D(latitude:35.167818, longitude:129.070586)
        
         let loc02 = CLLocationCoordinate2D(latitude:35.166078, longitude:129.072522)
        
        let span = MKCoordinateSpan(latitudeDelta:0.01,longitudeDelta:0.01)
        
        let region = MKCoordinateRegion(center: center, span: span)
        
        myMapview.setRegion(region, animated: true)
        
        
        let pin01 = MKPointAnnotation()
        pin01.coordinate = loc01
        pin01.title = "번개반점"
        pin01.subtitle = "부산광역시 부산진구 양정동 418-282"
        myMapview.addAnnotation(pin01)
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "DIT 동의과학대학교"
        pin02.subtitle = "부산광역시 부산진구 양정동 429-19"
        myMapview.addAnnotation(pin02)
        
        let addr = "부산광역시 부산진구 양정1동 350-1"
        let geocder = CLGeocoder()
        geocder.geocodeAddressString(addr){
        
            (placemarks: [CLPlacemark]?, error: Error?)-> Void in
            if let error = error{
                print(error)
                return
            }else{
                print("nil 발생")
            }
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
            let loc02 = placemark.location?.coordinate
                let pin03 = MKPointAnnotation()
                pin03.coordinate = loc02!
                pin03.title = "토마토 도시락"
                pin03.subtitle = addr
                self.myMapview.addAnnotation(pin03)
            }else{
                print("nil 발생")
            }
            
        
        }
    }
}

