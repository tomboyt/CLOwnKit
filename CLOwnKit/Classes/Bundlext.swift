//
//  Bundlext.swift
//  UniversalToolKit
//
//  Created by admin on 2022/4/19.
//

import Foundation
import UIKit
extension Bundle{
    public static func pngUrl(sourceBundle: Bundle, fileName: String, inDirectory : String?=nil) -> String?{
        var tempName = fileName
        var tempUrl = ""
        if fileName.contains("@"){
            tempName = fileName.components(separatedBy: "@").first!
        }
        let scale = UIScreen.main.scale
        if abs(scale-3) <= 0.001{
            if let Url = tempUrlForResource_3x(sourceBundle: sourceBundle,fileName: tempName,inDirectory: inDirectory){
                tempUrl = Url
            }else if let Url = tempUrlForResource_2x(sourceBundle: sourceBundle, fileName: tempName,inDirectory: inDirectory){
                tempUrl = Url
            }else if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResourceinDirectory(sourceBundle: sourceBundle, fileName: tempName,inDirectory: inDirectory!){
                return Url
            }
        }else if abs(scale-2) <= 0.001{
            if let Url = tempUrlForResource_2x(sourceBundle: sourceBundle,fileName: tempName,inDirectory: inDirectory){
                tempUrl = Url
            }else if let Url = tempUrlForResource_3x(sourceBundle: sourceBundle, fileName: tempName,inDirectory: inDirectory){
                tempUrl = Url
            }else if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResourceinDirectory(sourceBundle: sourceBundle, fileName: tempName,inDirectory: inDirectory!){
                return Url
            }
        }else{
            if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: tempName){
                tempUrl = Url
            }else if let Url = tempUrlForResource_2x(sourceBundle: sourceBundle,fileName: tempName,inDirectory: inDirectory){
                tempUrl = Url
            }else if let Url = tempUrlForResource_3x(sourceBundle: sourceBundle, fileName: tempName,inDirectory: inDirectory){
                tempUrl = Url
            }else if let Url = tempUrlForResourceinDirectory(sourceBundle: sourceBundle, fileName: tempName,inDirectory: inDirectory!){
                return Url
            }
            
        }
        return tempUrl
    }
    fileprivate static func tempUrlForResource(sourceBundle: Bundle, fileName: String)->String?{
        return sourceBundle.path(forResource:fileName, ofType: "png")
    }
    public static func tempUrlForResourceinDirectory(sourceBundle: Bundle, fileName: String,inDirectory : String)->String?{
        return sourceBundle.path(forResource: fileName, ofType: "png", inDirectory: inDirectory)
    }
    fileprivate static func tempUrlForResource_3x(sourceBundle: Bundle, fileName: String,inDirectory : String?=nil)->String?{
        if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: fileName + "@3x"){
            return Url
        }else{
            return tempUrlForResourceinDirectory(sourceBundle: sourceBundle, fileName: fileName + "@3x",inDirectory: inDirectory!)
        }
    }
    fileprivate static func tempUrlForResource_2x(sourceBundle: Bundle, fileName: String,inDirectory : String?=nil)->String?{
        if let Url = tempUrlForResource(sourceBundle: sourceBundle, fileName: fileName + "@2x"){
            return Url
        }else{
            return tempUrlForResourceinDirectory(sourceBundle: sourceBundle, fileName: fileName + "@2x",inDirectory: inDirectory!)
        }
    }
}
