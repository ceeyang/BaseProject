//
//  HomeViewController.swift
//  PillarsCollege
//
//  Created by smile on 19/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit
import MJRefresh
import PKHUD

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,HomeTableViewCellDelegate {
    
    var mBannerView: BannerView!
    var mTableView: UITableView!
    var header: MJRefreshNormalHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarTitle(titleString: "深圳市源泰达医院")
        setupTableView()
        addRefresh()
    }
    
    func setupTableView() {
        mBannerView = BannerView(frame: CGRect(x: 0, y: 0, w: kScreenWidth, h: 180))
        mTableView = UITableView(frame: view.frame, style: .plain)
        mTableView.backgroundColor = UIColor.white
        mTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "cell")
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.showsVerticalScrollIndicator = false
        mTableView.rowHeight = 100
        mTableView.tableHeaderView = mBannerView
        mTableView.tableFooterView = UIView()
        view.addSubview(mTableView)
        mTableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.top.equalTo(view.snp.top).offset(64)
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

// MARK: UITableViewDelegate,UITableViewDataSource
extension HomeViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        cell.mDelegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController {
    func HomeTabelViewCell_MoreButtonAction() {
        HUD.flash(.label("功能还在开发中"), delay: 1.5)
    }
    
    func HomeTableViewCell_TakeStockButtonAction() {
        navigationController?.pushViewController(TakeStockViewController(), animated: true)
    }
}
