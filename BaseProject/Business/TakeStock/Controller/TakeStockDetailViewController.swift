//
//  TakeStockDetailViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 16/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class TakeStockDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var mTableHeaderView: TakeStockDetailHeaderView = {
        let header = TakeStockDetailHeaderView(frame: CGRect(x: 0, y: 0, w: kScreenWidth, h: 180))
        return header
    }()
    
    lazy var mTableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.className)
        tableView.register(TakeStockDetailTableSectionView.self, forHeaderFooterViewReuseIdentifier: TakeStockDetailTableSectionView.className)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .kAppBaseColor
        tableView.tableHeaderView = mTableHeaderView
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sethNavigationBarTitle(titleString: "盘点单", withSearchBar: false)
        view.addSubview(mTableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TakeStockDetailViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 100 : 30
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TakeStockDetailTableSectionView.className) as! TakeStockDetailTableSectionView
        header.isCheckBalance(section == 0)
        return header
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, w: kScreenWidth, h: 0.1))
//        return view
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.1
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.className)
        cell?.selectionStyle = .none
        if indexPath.section == 0 {
            cell?.textLabel?.numberOfLines = 0
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 13)
            cell?.textLabel?.textColor = .kTitleColor
            cell?.textLabel?.text = """
            盘点人        : 管理员
            
            盘点日期     : 2017年08月16日20:35:32
            
            盘点单名称 : 中心仓库盘点
            """
            cell?.imageView?.image = UIImage(named:"takeStock")?.withColor(.kNavigationBarColor)
        }
        return cell!
    }
}
