//
//  MainNavigationController.swift
//  PillarsCollege
//
//  Created by smile on 19/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit

enum ImageAlignment {
    case left,right
}

class MainNavigationController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarStyle()
    }
    
    func setNavigationBarStyle() {
        //let image     = UIImage(named: "common_actionbar_bg")
        //navigationBar.setBackgroundImage(image, for: .default)
        navigationBar.tintColor = UIColor.white
        UIApplication.shared.statusBarStyle = .lightContent
        navigationBar.barTintColor = .kNavigationBarColor
        navigationBar.barStyle = .black;
        self.delegate = self
        
    }
    
    @objc func backAction()
    {
        popViewController(animated: true)
    }
    
    @objc func searchAction()
    {
        //        presentVC(SearchViewController())
    }
    
    func BarButtonItemWithTarget(_ target:Any?,action:Selector,image:String,selectedImg:String, imageAlignment:ImageAlignment) -> UIBarButtonItem {
        let btn = UIButton(type: .custom)
        btn.addTarget(target, action: action, for: .touchUpInside)
        btn.setImage(UIImage(named:image), for: .normal)
        btn.setImage(UIImage(named:selectedImg), for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        switch imageAlignment {
        case .left:
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10)
            break
        case .right:
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10)
            break
        }
        return UIBarButtonItem(customView: btn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension MainNavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if self.viewControllers.count > 0
        {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem  = BarButtonItemWithTarget(self, action: #selector(backAction), image: "public_nav_btn_return_n", selectedImg: "public_nav_btn_return_pre",imageAlignment:.left)
            viewController.navigationItem.rightBarButtonItem = BarButtonItemWithTarget(self, action: #selector(searchAction), image: "course_nav_btn_search_n", selectedImg: "course_nav_btn_search_n_pre",imageAlignment:.right)
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool)
    {
        //实现滑动返回功能
        //清空滑动返回手势的代理就能实现
        if viewController == self.viewControllers[0]
        {
            self.interactivePopGestureRecognizer!.delegate = self
        }
        else
        {
            self.interactivePopGestureRecognizer!.delegate = nil
        }
    }
}

extension UIViewController {
    
    func sethHomeNavigationBarTitle(titleString:String) {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = titleString
        navigationItem.titleView = titleLabel
        
        let logoImage = UIImage(named:"app_logo")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: logoImage, style: .plain, target: self, action: #selector(logoButtonAction))
        
        let scanImage = UIImage(named:"navigationbar_scan")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scanImage, style: .plain, target: self, action: #selector(scanButtonAction))
    }
    
    func sethNavigationBarTitle(titleString:String, withSearchBar:Bool) {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.text = titleString
        navigationItem.titleView = titleLabel
        
        let searchBarItem = UIBarButtonItem(image: UIImage(named:"navigationbar_scan"), style: .plain, target: self, action: #selector(searchButtonAction))
        let scanBarItem = UIBarButtonItem(image: UIImage(named:"navigationbar_scan"), style: .plain, target: self, action: #selector(scanButtonAction))
        if withSearchBar {
            navigationItem.rightBarButtonItems = [scanBarItem,searchBarItem]
        } else {
            navigationItem.rightBarButtonItem = scanBarItem
        }
    }
    
    @objc func logoButtonAction() {
        presentVC(LoginViewController())
    }
    
    @objc func scanButtonAction() {
        pushVC(ScanQRCodeController())
    }

    @objc func searchButtonAction() {
        print("search btn click")
    }
}


