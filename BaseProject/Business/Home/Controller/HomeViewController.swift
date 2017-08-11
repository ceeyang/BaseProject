//
//  HomeViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.random()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let multilineString = """
            This is a multi-line string.
        You don't have to escape "quotes" in here.
        String interpolation works as expected: 2 + 3 = \(2 + 3)
        The position of the closing delimiter
        controls whitespace stripping.
        """
        print(multilineString)
        
        let centerLabel = UILabel()
        view.addSubview(centerLabel)
        centerLabel.numberOfLines = 0;
        centerLabel.text = multilineString
        centerLabel.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
        
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
