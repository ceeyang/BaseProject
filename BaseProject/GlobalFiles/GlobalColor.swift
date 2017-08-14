//
//  GlobalColor.swift
//  PillarsCollege
//
//  Created by smile on 19/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit

extension UIColor {
    /* 导航栏颜色 */
    public class var kNavigationBarColor: UIColor {
        get {
            return RGB(r: 87, g: 201, b: 202)
        }
    }
    
    /* 标题颜色 */
    public class var kTitleColor: UIColor {
        get {
            return RGB(r: 51, g: 51, b: 51)
        }
    }
    
    /* 副标题颜色 */
    public class var kContentColor: UIColor {
        get {
            return RGB(r: 136, g: 136, b: 136)
        }
    }
    
    /* 公共背景色 */
    public class var kAppBaseColor: UIColor {
        get {
            return RGB(r: 243, g: 243, b: 243)
        }
    }
    
    /* banner 下面指示器颜色 */
    public class var kBannerLineColor: UIColor {
        get {
            return RGB(r: 235, g: 165, b: 58)
        }
    }
}
