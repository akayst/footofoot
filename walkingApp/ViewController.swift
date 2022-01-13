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

class ViewController: UIViewController, CLLocationManagerDelegate, NMFMapViewTouchDelegate{
    @IBOutlet var mapView: NMFMapView!
    var locationManager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLoc = locations.last?.coordinate
        let lastLat = lastLoc?.latitude
        let lastLon = lastLoc?.longitude
        
        print("현재 갱신 \(lastLoc)")
        
    }
    var pathArr:Array<AnyObject> = []
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("해당위치의 위도는 \(latlng.lat),\(latlng.lng)")
        pathArr.append(latlng)
        print(pathArr)
        
        let pathOverlay = NMFPath()
        let path = pathOverlay.path
        pathOverlay.path = NMGLineString(points: pathArr)
        pathOverlay.mapView = mapView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.positionMode = .compass
        mapView.touchDelegate = self
        
        
        
       
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            print("현재 서비스 on 상태")
            locationManager.startUpdatingLocation()
            print("현재위치 : \(locationManager.location?.coordinate)")
            let currentLat = (locationManager.location?.coordinate.latitude)!
            let currentLon = (locationManager.location?.coordinate.longitude)!
            print(currentLon)
            
        }
        else{
            print("현재 위치정보 서비스 off 상태")
        }
    }
}

