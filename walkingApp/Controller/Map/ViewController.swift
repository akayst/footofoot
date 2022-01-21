//
//  ViewController.swift
//  walkingApp
//
//  Created by akay on 2022/01/10.
//

import UIKit
import NMapsMap
import CoreLocation
import Alamofire
import SwiftyJSON
import Floaty
import FloatingPanel


class ViewController: UIViewController, CLLocationManagerDelegate, NMFMapViewTouchDelegate, FloatingPanelControllerDelegate{
  
    @IBOutlet var mapView: NMFMapView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
     var locationManager = CLLocationManager()
     func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         let lastLoc = locations.last?.coordinate
         let lastLat = lastLoc?.latitude
         let lastLon = lastLoc?.longitude
         
         print("현재 갱신 \(lastLoc)")
         
     }
     let pathOverlay = NMFPath()
     var pathArr:Array<NMGLatLng> = []
     var count = 0
     var distance1 = 0.0
     var walkingpoint1 = 0.0
     var api = walkmodel()
     
     func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
         print("해당위치의 위도는 \(latlng.lat),\(latlng.lng)")
         self.pathArr.append(latlng)
         
         let path = pathOverlay.path
         pathOverlay.path = NMGLineString(points: pathArr)
         print(self.pathArr)
         if pathArr.count > 1 {
             distance1 += pathArr[count-1].distance(to: pathArr[count])
             count+=1
             print("추가된 거리는 \(distance1)m 입니다")
         }
         else{
             print("첫번째 경로입니다.")
             count+=1
         }
         let ad = UIApplication.shared.delegate as? AppDelegate
         ad?.distanceInfo = distance1
         ad?.walkingPointInfo = 1.25 * distance1
         print("\(distance1)m 입니다")
         pathOverlay.progress = 0.5
         pathOverlay.width = 10
         pathOverlay.color = .black
         pathOverlay.outlineColor = .green
         pathOverlay.patternInterval = 5
         pathOverlay.mapView = mapView
         
         
     }
     var fpc : FloatingPanelController!
     
     override func viewDidLoad() {
                 super.viewDidLoad()
         // Do any additional setup after loading the view.
         mapView.positionMode = .compass
         mapView.touchDelegate = nil
         fpc = FloatingPanelController()
         fpc.delegate = self
         
         guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "fpc_content") as? myViewController else{
             return
         }
         fpc.set(contentViewController: contentVC)
         fpc.changePanelStyle()
         fpc.addPanel(toParent: self)
         fpc.panGestureRecognizer.isEnabled = true
         //fpc.layout = MyFloatingPanelLayout()
         let floaty = Floaty()
         floaty.addItem("스케치 하기", icon: UIImage(named:"icon")) { FloatyItem in
             self.pathOverlay.mapView = nil
             print("click")
             self.pathArr = []
             self.mapView.touchDelegate = self
             let test = Floaty()
             test.addItem(title: "업로드하기") { FloatyItem
                 in
                 print("업로드성공")
             }
             test.addItem(title: "스케치 지우기") { FloatyItem in
                 if self.pathArr.isEmpty{
                     self.pathArr.removeAll()
                     self.pathOverlay.mapView = nil
                 }
                 else{
                     self.pathArr.removeLast()
                     for arr in self.pathArr{
                     self.pathOverlay.path = NMGLineString(points:self.pathArr)
                     self.pathOverlay.mapView = self.mapView
                     print(arr)
                     }
                 }
             }
             test.addItem(title: "스케치 그만하기") { FloatyItem in
                 self.api.walkingPoint = self.distance1 * 1.25
                 self.api.distance = self.distance1
                 self.api.pathModel = self.pathArr
                 self.mapView.touchDelegate = nil
                 self.pathArr = []
                 self.pathOverlay.mapView = nil
                 self.count = 0

                 print("통신--")
                 print(self.api.pathModel)
                 print(self.api.distance)
                 print(self.api.walkingPoint)
                 print("---")
                 self.view.addSubview(floaty)
                 
             }
             self.view.addSubview(test)
         }
         self.view.addSubview(floaty)
         locationManager.delegate = self
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.requestWhenInUseAuthorization()
         
         if CLLocationManager.locationServicesEnabled() {
             print("현재 서비스 on 상태")
             locationManager.startUpdatingLocation()
             print("현재위치 : \(locationManager.location?.coordinate)")
             let currentLat = locationManager.location?.coordinate.latitude
             let currentLon = locationManager.location?.coordinate.longitude
             print(currentLon)
             
         }
         else{
             print("현재 위치정보 서비스 off 상태")
         }
         let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0))
         mapView.moveCamera(cameraUpdate)
     }
 }

 extension FloatingPanelController{
     func changePanelStyle(){
         let appearance = SurfaceAppearance()
         let shadow = SurfaceAppearance.Shadow()
         let test =
         shadow.color = UIColor.black
         shadow.offset = CGSize(width: 0, height: -4.0)
         shadow.opacity = 0.3
         shadow.radius = 10.0
         appearance.shadows = [shadow]
         appearance.cornerRadius = 30
         surfaceView.containerMargins = .init(top: 100.0, left: 10.0, bottom: 300.0, right: 10.0)
         appearance.backgroundColor = .clear
         appearance.borderColor = .clear
         appearance.borderWidth = 0
         surfaceView.grabberHandle.isHidden = true
         surfaceView.appearance = appearance
     }
 }
