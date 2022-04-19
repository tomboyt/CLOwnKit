//
//  Bundlext.swift
//  UniversalToolKit
//
//  Created by admin on 2022/4/19.
//

import Foundation
import UIKit

extension Bundle{
    public static func pngUrl(sourceBundle: Bundle, fileName: String) -> String?{
        var tempName = fileName
        var tempUrl = ""
        if fileName.contains("@"){
            tempName = fileName.components(separatedBy: "@").first!
        }
        let scale = UIScreen.main.scale
        if abs(scale-3) <= 0.001{
            if let Url = tempUrlForResource_3x(sourceBundle: sourceBundle,fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource_2x(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }
        }else if abs(scale-2) <= 0.001{
            if let Url = tempUrlForResource_2x(sourceBundle: sourceBundle,fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource_3x(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }
        }else{
            if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource_2x(sourceBundle: sourceBundle,fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource_3x(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }
            
        }
        return tempUrl
    }
    fileprivate static func tempUrlForResource(sourceBundle: Bundle, fileName: String)->String?{
        return sourceBundle.path(forResource:fileName, ofType: "png")
    }
    fileprivate static func tempUrlForResource_3x(sourceBundle: Bundle, fileName: String)->String?{
        return tempUrlForResource(sourceBundle: sourceBundle, fileName: fileName + "@3x")
    }
    fileprivate static func tempUrlForResource_2x(sourceBundle: Bundle, fileName: String)->String?{
        return tempUrlForResource(sourceBundle: sourceBundle, fileName: fileName + "@2x")
    }
}
