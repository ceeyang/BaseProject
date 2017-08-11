//
//  ExtensionFile.swift
//  PillarsCollege
//
//  Created by smile on 19/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit
import Foundation
import ObjectiveC
import SwiftyJSON
import EZSwiftExtensions

//MARK: - String
extension String {
    var length: Int {
        return characters.count
    }  // Swift 2.0\
    
    func checkEmpty() -> String {
        if self.length == 0 {
            return ""
        }
        return self
    }
    
    var isNotEmpty: Bool {
        if length == 0 { return false}
        else { return true }
    }
    
}

//MARK: - NSDictionary
extension NSDictionary{
    
    public func JSONString() -> NSDictionary {
        
        let data = try!JSONSerialization.data(withJSONObject: self, options: [])
        let strJson=NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        let dict:NSDictionary = ["json":strJson!]
        return dict
    }
}

extension Dictionary {
    public func JSONString() -> Dictionary {
        let data = try!JSONSerialization.data(withJSONObject: self, options: [])
        let strJson = String(data: data, encoding: String.Encoding.utf8)
        let dict = ["json":strJson]
        return dict as! Dictionary<Key, Value>
    }
}



/*------------------------- 我是萌萌哒的分割线 -------- #^_^# ---------------------------------------*/
//MARK: - UIButton

var ActionBlockKey : UInt8        = 00*00
typealias buttonActionClosure     = (_ sender:UIButton)->Void

class ActionBlockWrapper: NSObject {
    var block :buttonActionClosure
    init(block: @escaping buttonActionClosure) {
        self.block = block
    }
}

extension UIButton {
    
    func addAction(block:@escaping buttonActionClosure) {
        objc_setAssociatedObject(self, &ActionBlockKey, ActionBlockWrapper(block:block),  objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(block_handleAction(sender:)), for: .touchUpInside)
    }
    
    @objc func block_handleAction(sender:UIButton) {
        let wrapper = objc_getAssociatedObject(self, &ActionBlockKey) as! ActionBlockWrapper
        wrapper.block(sender)
        
    }
}


//========================================================
// MARK: - TapGesture Action Closure -
//========================================================
var TapGestureActionBlockKey : UInt8   = 00*01
typealias TapGestureActionClosure      = (_ sender:UITapGestureRecognizer)->Void

class TapGestureActionBlockWrapper: NSObject {
    var TapGestureBlock :TapGestureActionClosure
    init(block: @escaping TapGestureActionClosure) {
        self.TapGestureBlock = block
    }
}

extension UITapGestureRecognizer {
    
    func addAction(block:@escaping TapGestureActionClosure) {
        objc_setAssociatedObject(self, &TapGestureActionBlockKey, TapGestureActionBlockWrapper(block:block),  objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        addTarget(self, action: #selector(block_handleAction(sender:)))
    }
    
    @objc func block_handleAction(sender:UITapGestureRecognizer) {
        let wrapper = objc_getAssociatedObject(self, &TapGestureActionBlockKey) as! TapGestureActionBlockWrapper
        wrapper.TapGestureBlock(sender)
    }
}

/*------------------------- 我是萌萌哒的分割线 -------- #^_^# ---------------------------------------*/
extension Collection {
    var isNotEmpty: Bool {
        if self.isEmpty {
            return false
        } else {
            return true
        }
    }
}

extension UIImage {
    
    func kt_drawRectWithRoundedCorner(radius: CGFloat, _ sizetoFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizetoFit)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        UIGraphicsGetCurrentContext()!.addPath(UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners,
                                                            cornerRadii: CGSize(width: radius, height: radius)).cgPath)
        UIGraphicsGetCurrentContext()?.clip()
        
        self.draw(in: rect)
        UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return output!
    }
}

extension UIImageView {
    /**
     / !!!只有当 imageView 不为nil 时，调用此方法才有效果
     :param: radius 圆角半径
     */
    func kt_addCorner(radius: CGFloat) {
        self.image = self.image?.kt_drawRectWithRoundedCorner(radius: radius, self.bounds.size)
    }
}




















