import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //번개반점
        //35.167578, 129.070568
        //부산광역시 부산진구 양정동 418-282
        //051-852-9969
        
        //DIT
        //35.165782, 129.072529
        //부산광역시 부산진구 양정동 양지로 54
        //051-852-0011
        
        //중심 위도, 경도로 설정
        let center = CLLocationCoordinate2D(latitude: 35.165782, longitude: 129.072529)
        
        //번개반점
        let loc01 = CLLocationCoordinate2D(latitude: 35.167578, longitude: 129.070568)
        
        //반경(zoom in, zoom out) 설정
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        //region 객체는 center, span을 묶는것
        let region = MKCoordinateRegion(center: center, span: span)
        
        //지도에 표시하기
        myMapView.setRegion(region, animated: true)
        
        ////annotation 표시하기
        let pin01 = MKPointAnnotation()
        pin01.coordinate = loc01
        pin01.title = "번개반점"
        pin01.subtitle = "부산광역시 부산진구 양정동 418-282"
        myMapView.addAnnotation(pin01)
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate = center
        pin02.title = "동의과학대"
        pin02.subtitle = "부산광역시 부산진구 양정동 양지로 54"
        myMapView.addAnnotation(pin02)
        
        //// geocoding 클로저
        let addr = "부산광역시 부산진구 양정1동 350-1"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addr) {
            
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            if let error = error {
                print(error)
                return
            } else {
                print("nil 발생")
            }
            if let placemarks = placemarks {
                
                let placemarks = placemarks[0]
                //                print(placemarks.location!)
                //                print(placemarks.name!)
                //                print(placemarks.postalCode!)
                //                print(placemarks.country!)
                let loc02 = placemarks.location?.coordinate
                let pin03 = MKPointAnnotation()
                pin03.coordinate = loc02!
                pin03.title = "늘해랑"
                pin03.subtitle = addr
                self.myMapView.addAnnotation(pin03)
            } else {
                print("nil 발생")
            }
        }
    }
}
