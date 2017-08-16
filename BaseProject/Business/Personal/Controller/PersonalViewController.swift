//
//  PersonalViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit
import PKHUD


class PersonalViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var mTableHeaderView: PersonHeaderView = {
        let header = PersonHeaderView(frame: CGRect(x: 0, y: 0, w: kScreenWidth, h: 200))
        return header
    }()
    
    lazy var mTableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .kAppBaseColor
        tableView.rowHeight = 60
        tableView.showsVerticalScrollIndicator = false
        tableView.tableHeaderView = mTableHeaderView
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var mDataArr:[String] = ["换肤","联系我们"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        sethHomeNavigationBarTitle(titleString: "深圳市源泰达医院")
        
        view.addSubview(mTableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension PersonalViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, w: kScreenWidth, h: 30))
        view.backgroundColor = .kAppBaseColor
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, w: kScreenWidth, h: 0.1))
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.selectionStyle = .none
        let isNotLogoutButton = indexPath.section == 0
        cell?.accessoryType = isNotLogoutButton ? .disclosureIndicator : .none
        cell?.imageView?.image = isNotLogoutButton ? UIImage(named:"app_logo") : nil
        cell?.textLabel?.text = isNotLogoutButton ? "\(mDataArr[indexPath.row])" : "退出登录"
        cell?.textLabel?.textAlignment = isNotLogoutButton ? .left : .center
        cell?.textLabel?.textColor = isNotLogoutButton ? .kContentColor : .red
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            HUD.flash(.label("功能还在开发中"), delay: 1.5)
        } else {
            let alert = UIAlertController(title: "", message: "退出不会删除您的任何数据，你依然也可以使用该账户重新登录。", preferredStyle: .actionSheet)
            let logoutBtn = UIAlertAction(title: "退出", style: .destructive, handler: { (action) in
                HUD.flash(.labeledSuccess(title: nil, subtitle: "退出成功"),delay:1.5)
            })
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: { (action) in
                print(action)
            })
            alert.addAction(logoutBtn)
            alert.addAction(cancelAction)
            alert.show()
        }
    }
}
