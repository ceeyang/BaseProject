//
//  TakeStockDetailHeaderView.swift
//  BaseProject
//
//  Created by 杨西川 on 16/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class TakeStockDetailHeaderView: UIView {

    lazy var mBackgroundImageView: UIImageView = {
        let imageVeiw = UIImageView(frame: frame)
        imageVeiw.image = UIImage(named:"TakeStockDetailBackgoundImage")
        return imageVeiw
    }()
    
    lazy var mTotalCountDeviceLabel: UILabel = {
        let label = UILabel()
        label.text = "666/888"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .kTitleColor
        label.textAlignment = .left
        return label
    }()
    
    lazy var mDeviceLabel: UILabel = {
        let label = UILabel()
        label.text = "台设备已盘点"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .kTitleColor
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mBackgroundImageView)
        mBackgroundImageView.addSubview(mTotalCountDeviceLabel)
        mTotalCountDeviceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mBackgroundImageView.snp.left).offset(30)
            make.bottom.equalTo(mBackgroundImageView.snp.centerY)
        }
        
        mBackgroundImageView.addSubview(mDeviceLabel)
        mDeviceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mTotalCountDeviceLabel.snp.left)
            make.top.equalTo(mBackgroundImageView.snp.centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
