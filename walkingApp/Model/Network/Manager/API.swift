//
//  API.swift
//  walkingApp
//
//  Created by akay on 2022/01/21.
//

import Foundation
import FirebaseFirestore
import Alamofire
import SwiftyJSON
import Firebase
import NMapsMap

let db = Firestore.firestore()

let docRef = Firestore.firestore().collection("footofoot")

func postData(api:walkmodel){
    var url = "https://akayst-3d156.firebaseio.com/footofoot.json"
    let data: Parameters = [
        "cameraPositionLat" : api.cameraPositionLat,
        "cameraPositionLng" : api.cameraPositionLng,
        "userId" : api.userId,
        "walkingPoint" : api.walkingPoint,
        "distance" : api.distance,
        "pathModel" : [1.2,3.2]
    ]
    
    
    AF.request(url, method: .post, parameters: data, encoding: JSONEncoding.default, headers: ["Content-Type":"application/json","Accept":"application/json"]).responseJSON { response in
        switch response.result{
        case .success(var value):
            print(value)
        case .failure(_):
            print("errrr")
    }
    /*
    docRef.addDocument(data: data){ (error) in
        
        if let error = error{
            print("통신에러 ㅆㅆㅆ")
            print("\(data)")
        }else{
            print("통신 성공")
        }
     }*/}
}

func getData(){
    var url = "https://akayst-3d156.firebaseio.com/footofoot.json"
    
    AF.request(url, method: .get)
        .responseJSON { response in
            //print(response)
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print("------")
                print(json)
                print("-------")
                for (key,subJson):(String,JSON) in json{
                    
                    print("userId? -> \(subJson["userId"])")
                    print("pathModel -> \(subJson["pathModel"].arrayValue)")
                    print(subJson["pathModel"].rawValue)
                    print(subJson["pathModel"].array?.first)
                    print(subJson)
                }
                /*
                
                for (key,subJson):(JSON) in json{
                    print("ㅁㅁ")
                
                    print("userId? -> \(subJson["fields"]["userId"]["stringValue"].stringValue)")
                    print("CameraPositionLat -> \(subJson["fields"]["cameraPositionLat"]["doubleValue"].doubleValue)")
                    print("CameraPositionLng -> \(subJson["fields"]["cameraPositionLng"]["doubleValue"].doubleValue)")
                    print(subJson["fields"]["pathModel"]["arrayValue"]["values"].rawValue)

                }
                 */
                
            case .failure(_):
                print("err")
            }
        }
}

