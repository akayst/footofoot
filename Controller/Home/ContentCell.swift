//
//  ContentCell.swift
//  walkingApp
//
//  Created by John Hur on 2022/01/21.
//

import Foundation
import UIKit

class ContentCell: UITableViewCell {
    
    @IBOutlet var backView: UIView!
    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var userMiniProfileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabelDeviceClass!
    @IBOutlet var totalWalkingPointLabel: UILabelDeviceClass!
    @IBOutlet var totalDistanceLabel: UILabelDeviceClass!
    @IBOutlet var totalTimeLabel: UILabelDeviceClass!
    
    @IBOutlet var lastUpdatedDate: UILabelDeviceClass!
    
    
    override func awakeFromNib() {
      super.awakeFromNib()
    }

//    func initContentList() {_ data: 
//        
//    }
    
    
}

