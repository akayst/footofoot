//  UILabelDeviceClass.swift
//  testUI
//
//  Created by John Hur on 2022/01/19.
//

import Foundation
import UIKit

//MARK: - iOS Device 별 다이나믹 폰트를 적용 시켜 줌

class UILabelDeviceClass : UILabel {

@IBInspectable var iPhoneFontSize:CGFloat = 0 {
    didSet {
        overrideFontSize(fontSize: iPhoneFontSize)
    }
}

func overrideFontSize(fontSize:CGFloat){
    let currentFontName = self.font.fontName
    var calculatedFont: UIFont?
    let bounds = UIScreen.main.bounds
    let height = bounds.size.height
    switch height {
    case 480.0: //Iphone 3,4,SE => 3.5 inch
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.7)
        self.font = calculatedFont
        break
    case 568.0: //iphone 5, 5s => 4 inch
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.8)
        self.font = calculatedFont
        break
    case 667.0: //iphone 6, 6s, SE 2nd gen => 4.7 inch
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.9)
        self.font = calculatedFont
        break
    case 736.0: //iphone 6s+ 6+ 7 => 5.5 inch
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.0)
        self.font = calculatedFont
        break
    case 812.0: //iphone X, XS, 11 Pro, 12 mini, 13 mini => 5.8 inch
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.1)
        self.font = calculatedFont
        break
    case 844.0: // iphone 12 Pro, 12, 13 Pro, 13
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.2)
        self.font = calculatedFont
    case 896.0: //iphone XR => 6.1 inch, 11, 11 Pro Max  // iphone XS MAX => 6.5 inch
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.3)
        self.font = calculatedFont
        break
    case 926.0: //iphone 13 pro max, 12 Pro Max
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 1.4)
        self.font = calculatedFont
        break
    case 1640.0: //iphone 13 pro max, 12 Pro Max
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 100.0)
        self.font = calculatedFont
        break
    case 2360.0: //iphone 13 pro max, 12 Pro Max
        calculatedFont = UIFont(name: currentFontName, size: fontSize * 100.0)
        self.font = calculatedFont
        break


    default:
        print("not an iPhone")
        break
        }

    }
}
