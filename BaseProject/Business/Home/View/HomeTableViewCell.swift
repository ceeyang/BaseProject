//
//  HomeTableViewCell.swift
//  BaseProject
//
//  Created by 杨西川 on 14/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

protocol HomeTableViewCellDelegate {
    func HomeTabelViewCell_MoreButtonAction()
    func HomeTableViewCell_TakeStockButtonAction()
}

class HomeTableViewCell: UITableViewCell {

    var mTakeStockView: UIButton!
    var mTakeStockViewTitleLabel: UILabel!
    var mTakeStockViewDescriptionLabel: UILabel!
    var mTakeStockViewImageView: UIImageView!
    var mMoreButtonView: UIButton!
    var mMoreButtonTitleLabel: UILabel!
    var mMoreButtonImageView: UIImageView!
    var mDelegate: HomeTableViewCellDelegate!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        mTakeStockView = UIButton()
        mTakeStockView.backgroundColor = RGB(r: 227, g: 122, b: 120)
        mTakeStockView.layer.masksToBounds = true
        mTakeStockView.layer.cornerRadius = 5
        contentView.addSubview(mTakeStockView)
        weak var weakself = self
        mTakeStockView.addAction { (sender) in
            weakself?.mDelegate?.HomeTableViewCell_TakeStockButtonAction()
        }
        mTakeStockView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView.snp.left).offset(15)
            make.top.equalTo(contentView.snp.top).offset(5)
            make.width.equalTo((kScreenWidth-45)/5*3)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
        
        
        mTakeStockViewTitleLabel = UILabel()
        mTakeStockViewTitleLabel.text = "设备盘点"
        mTakeStockViewTitleLabel.font = UIFont.systemFont(ofSize: 15)
        mTakeStockViewTitleLabel.textColor = .white
        mTakeStockViewTitleLabel.textAlignment = .left
        mTakeStockView.addSubview(mTakeStockViewTitleLabel)
        mTakeStockViewTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(mTakeStockView.snp.top).offset(5)
            make.left.equalTo(mTakeStockView.snp.left).offset(5)
            make.right.equalTo(mTakeStockView.snp.right).offset(-50)
            make.height.equalTo(30)
        }
        
        mTakeStockViewDescriptionLabel = UILabel()
        mTakeStockViewDescriptionLabel.numberOfLines = 2
        mTakeStockViewDescriptionLabel.font = UIFont.systemFont(ofSize: 12)
        mTakeStockViewDescriptionLabel.textAlignment = .left
        mTakeStockViewDescriptionLabel.textColor = .white
        mTakeStockViewDescriptionLabel.text = "    资产设备扫描盘点"
        mTakeStockView.addSubview(mTakeStockViewDescriptionLabel)
        mTakeStockViewDescriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mTakeStockView.snp.left).offset(5)
            make.right.equalTo(mTakeStockView.snp.right).offset(-50)
            make.top.equalTo(mTakeStockViewTitleLabel.snp.bottom)
        }
        
        mTakeStockViewImageView = UIImageView()
        mTakeStockViewImageView.image = UIImage(named:"takeStock")
        mTakeStockView.addSubview(mTakeStockViewImageView)
        mTakeStockViewImageView.snp.makeConstraints { (make) in
            make.right.equalTo(mTakeStockView.snp.right).offset(-5)
            make.bottom.equalTo(mTakeStockView.snp.bottom).offset(-5)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        mMoreButtonView = UIButton()
        mMoreButtonView.layer.masksToBounds = true
        mMoreButtonView.layer.cornerRadius = 5
        contentView.addSubview(mMoreButtonView)
        mMoreButtonView.backgroundColor = RGB(r: 137, g: 190, b: 62)
        mMoreButtonView.addAction { (sender) in
            weakself?.mDelegate?.HomeTabelViewCell_MoreButtonAction()
        }
        mMoreButtonView.snp.makeConstraints { (make) in
            make.right.equalTo(contentView.snp.right).offset(-15)
            make.left.equalTo(mTakeStockView.snp.right).offset(15)
            make.top.equalTo(contentView.snp.top).offset(5)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5)
        }
        
        mMoreButtonTitleLabel = UILabel()
        mMoreButtonTitleLabel.numberOfLines = 2
        mMoreButtonTitleLabel.textColor = .white
        mMoreButtonTitleLabel.font = UIFont.systemFont(ofSize: 15)
        mMoreButtonView.addSubview(mMoreButtonTitleLabel)
        mMoreButtonTitleLabel.text = """
         更多功能
        敬请期待
        """
        mMoreButtonTitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mMoreButtonView.snp.left).offset(5)
            make.right.equalTo(mMoreButtonView.snp.right).offset(-45)
            make.top.equalTo(mMoreButtonView.snp.top).offset(5)
            make.bottom.equalTo(mMoreButtonView.snp.bottom).offset(-5)
        }
        
        mMoreButtonImageView = UIImageView()
        mMoreButtonImageView.image = UIImage(named:"home_table_more")
        mMoreButtonView.addSubview(mMoreButtonImageView)
        mMoreButtonImageView.snp.makeConstraints { (make) in
            make.right.equalTo(mMoreButtonView.snp.right).offset(-5)
            make.bottom.equalTo(mMoreButtonView.snp.bottom).offset(-5)
            make.size.equalTo(CGSize(width: 35, height: 35))
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
