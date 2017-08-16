//
//  HadTakedStockViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 15/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit
import MJRefresh

/* 已有盘点 */

class HadTakedStockViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var mTableView: UITableView!
    var header: MJRefreshNormalHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        addRefresh()
    }

    func setupTableView() {
        mTableView = UITableView(frame: view.frame, style: .plain)
        mTableView.backgroundColor = UIColor.white
        mTableView.register(TakeStockTableViewCell.self, forCellReuseIdentifier: "cell")
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.showsVerticalScrollIndicator = false
        mTableView.rowHeight = 130
        mTableView.tableFooterView = UIView()
        view.addSubview(mTableView)
        mTableView.snp.makeConstraints { (make) in
            make.left.bottom.top.right.equalTo(view)
        }
    }
    
    func addRefresh() {
        header = MJRefreshNormalHeader(refreshingBlock: { [weak self] in
            delay(1) {
                self?.mTableView.reloadData()
                self?.mTableView.mj_header.endRefreshing()
            }
        })
        mTableView.mj_header = header
        header.beginRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HadTakedStockViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TakeStockTableViewCell
        cell.selectionStyle = .none
        cell.configCellWith(nil)
        return cell
    }
}

