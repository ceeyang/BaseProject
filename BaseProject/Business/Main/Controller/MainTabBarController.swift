//
//  MainTabBarController.swift
//  PillarsCollege
//
//  Created by smile on 19/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createChildVC()
    }
    
    public func createChildVC() {
        let homePage = HomeViewController()
        addChildVC(childVC: homePage, title: "首页", image: "tab_icon_home", selectedImage: "tab_icon_home_selected")
        
        let personalPage = PersonalViewController()
        addChildVC(childVC: personalPage, title: "我的", image: "tab_icon_home", selectedImage: "tab_icon_home_selected")
    }
    
    public func addChildVC(childVC: UIViewController,title:String,image:String,selectedImage:String) {
        childVC.title   = title;
        let normalImg   = UIImage(named: image)
        let selectedImg = UIImage(named: selectedImage)
        childVC.tabBarItem.image = normalImg?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = selectedImg?.withRenderingMode(.alwaysOriginal)
        let textAttrs = [NSAttributedStringKey.foregroundColor : RGB(r: 51, g: 51, b: 51)]
        let selectedTextAttrs = [NSAttributedStringKey.foregroundColor : UIColor.kNavigationBarColor]
        childVC.tabBarItem.setTitleTextAttributes(textAttrs, for: .normal)
        childVC.tabBarItem.setTitleTextAttributes(selectedTextAttrs, for: .selected)
        let nav = MainNavigationController(rootViewController: childVC)
        addChildViewController(nav)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

