//
//  TakeStockDetailTableSectionView.swift
//  BaseProject
//
//  Created by 杨西川 on 16/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class TakeStockDetailTableSectionView: UITableViewHeaderFooterView {

    lazy var mTakeStockDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "盘点单详情"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .blue
        return label
    }()

    lazy var mCheckBalanceBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("查看资产", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }()
    
    lazy var mCheckBalanceImage: UIImageView = {
        let iamgeView = UIImageView()
        
        return iamgeView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mCheckBalanceBtn)
        contentView.addSubview(mTakeStockDetailLabel)
        contentView.addSubview(mCheckBalanceImage)
        
        mCheckBalanceImage.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.centerY.equalTo(contentView.snp.centerY)
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        mCheckBalanceBtn.snp.makeConstraints { (make) in
            make.right.equalTo(mCheckBalanceImage.snp.left)
            make.centerY.equalTo(contentView.snp.centerY)
            make.height.equalTo(30)
        }
        
        mTakeStockDetailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.centerY.equalTo(contentView.snp.centerY)
        }
    }
    
    func isCheckBalance(_ ischeckoutBance:Bool) {
        mCheckBalanceBtn.isHidden = !ischeckoutBance
        mCheckBalanceImage.isHidden = !ischeckoutBance
        mTakeStockDetailLabel.isHidden = ischeckoutBance
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
