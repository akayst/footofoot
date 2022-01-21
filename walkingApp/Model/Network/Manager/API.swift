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

let docRef = Firestore.firestore().collection("test").document()
let docId = docRef.documentID

func postData(api:walkmodel){
    let data: [String:Any] = [
        
        "walkingPoint": api.walkingPoint,
        "distance": api.distance
        
    ]
    docRef.setData(data){ (error) in
        
        if let error = error{
            print("통신에러 ㅆㅆㅆ")
            print("\(data)")
        }else{
            print("통신 성공")
        }
    }
}
func getData(){
    var url = "https://firestore.googleapis.com/v1/projects/akayst-3d156/databases/(default)/documents/test"
    
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
                    
                    
                    print("walkingPoint? -> \(subJson["fields"]["walkingPoint"]["doubleValue"].doubleValue)")
                    
                }
                
            case .failure(_):
                print("err")
            }
        }
    
    }
