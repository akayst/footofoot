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

let db = Firestore.firestore()

let docRef = Firestore.firestore().collection("footofoot")

func postData(api:walkmodel){
    var url = "https://firestore.googleapis.com/v1/projects/akayst-3d156/databases/(default)/documents/footofoot"
    let data: Parameters = [
        "userId" : api.userId,
        "walkingPoint" : api.walkingPoint,
        "distance" : api.distance
    ]
    
    docRef.addDocument(data: data){ (error) in
        
        if let error = error{
            print("통신에러 ㅆㅆㅆ")
            print("\(data)")
        }else{
            print("통신 성공")
        }
    }
}
func getData(){
    var url = "https://firestore.googleapis.com/v1/projects/akayst-3d156/databases/(default)/documents/footofoot"
    
    AF.request(url, method: .get)
        .responseJSON { response in
            //print(response)
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print("------")
                print(json)
                print("-------")
                for (key,subJson):(String, JSON) in json["documents"]{
                    print("ㅁㅁ")
                    
                    
                    print("walkingPoint? -> \(subJson["fields"]["userId"]["stringValue"].stringValue)")
                    
                }
                
            case .failure(_):
                print("err")
            }
        }
}
