//
//  ApiModel.swift
//  walkingApp
//
//  Created by akay on 2022/01/19.
//

import Foundation
import NMapsMap

protocol DocumentSerializable{
    init?(dictionary:[String:Any])
}
struct walkmodel{
    
    var userId : String?
    var walkingPoint:Double?
    var distance:Double?
    var pathModel:Array<NMGLatLng> = []
    
    
    var dictionary: [String:Any]{
        return [
            "userId" : userId,
            "walkingPoint": walkingPoint,
            "distance": distance,
            "pathModel": pathModel
        ]
    }
}
