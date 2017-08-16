//
//  TakeStockTableViewCell.swift
//  BaseProject
//
//  Created by 杨西川 on 15/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class TakeStockTableViewCell: UITableViewCell {

    lazy var mImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"takeStock")?.withColor(.kNavigationBarColor)
        return imageView
    }()
    
    lazy var mTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .kTitleColor
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    lazy var mDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .kContentColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 4
        return label
    }()
    
    lazy var mTotalDeviceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .kContentColor
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    lazy var mStateView: UIButton = {
        let btn = UIButton()
        btn.isUserInteractionEnabled = false
        btn.setTitle("已完成", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitleColor(.green, for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    
    lazy var mDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(mImageView)
        mImageView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        contentView.addSubview(mTitleLabel)
        mTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mImageView.snp.right).offset(5)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-55)
        }
        
        contentView.addSubview(mDescriptionLabel)
        mDescriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(mTitleLabel)
            make.top.equalTo(mTitleLabel.snp.bottom)
        }
        
        contentView.addSubview(mTotalDeviceLabel)
        mTotalDeviceLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(mTitleLabel)
            make.top.equalTo(mDescriptionLabel.snp.bottom)
        }
        
        contentView.addSubview(mStateView)
        mStateView.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.top.equalTo(contentView.snp.top).offset(10)
            make.size.equalTo(CGSize(width: 40, height: 30))
        }
        
        contentView.addSubview(mDateLabel)
        mDateLabel.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.top.equalTo(mTotalDeviceLabel.snp.bottom)
        }
    
    }
    
    func configCellWith(_ model:Any? = nil) {
        mTitleLabel.text = "李科长的盘点"
        mDescriptionLabel.text = """
        1234567890
        一万一下
        中心仓库
        中心实验室
        """
        mTotalDeviceLabel.text = "总共：100/200台设备"
        mDateLabel.text = "2017年08月15日17:39:08"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
