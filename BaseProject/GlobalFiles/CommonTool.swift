//
//  CommonTool.swift
//  PillarsCollege
//
//  Created by smile on 19/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit

let kScreenWidth  : CGFloat = UIScreen.main.bounds.size.width
let kScreenHeight : CGFloat = UIScreen.main.bounds.size.height

//MARK: - Public Method
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    return RGBA(r: r, g: g, b: b, a: 1.0)
}

func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line) {
    let range = file.range(of: "PillarsCollege")
    let path  = file.substring(from: (range?.lowerBound)!)
    print("\(path)[\(line)], \(method): \(message)")
}
