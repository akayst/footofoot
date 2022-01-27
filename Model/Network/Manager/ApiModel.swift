//
//  ApiModel.swift
//  walkingApp
//
//  Created by akay on 2022/01/19.
//

import Foundation
import NMapsMap

struct walkmodel{
    
    var userId : String?
    var walkingPoint:Double?
    var distance:Double?
    var pathModel:Array<Any>?
    var cameraPositionLat : Double?
    var cameraPositionLng : Double?
    var profileImg = String?
}

struct testmodel{
    
    var userId : String?
    var walkingPoint:Double?
    var distance:Double?
    var pathModel:Array<Any>?
    var cameraPositionLat : Double?
    var cameraPositionLng : Double?
    
}

class mysingleton{
    static let shared = mysingleton()
    
    var modelData : [testmodel] = []
    
    
}
