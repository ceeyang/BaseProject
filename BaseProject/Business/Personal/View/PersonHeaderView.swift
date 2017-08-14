//
//  PersonHeaderView.swift
//  PillarsCollege
//
//  Created by smile on 21/07/2017.
//  Copyright © 2017 smile. All rights reserved.
//

import UIKit
import Kingfisher

typealias AvatorImageDidClickClosure = (_ mAvatorImageView:UIImageView) -> Void

class PersonHeaderView: UIView {
    
    var mAvatorImageView: UIImageView!
    var mNameLabel: UILabel!
    var mCompanyLabel: UILabel!
    var mCoinsLabel: UILabel!
    var mAvatorImageViewClickClourse: AvatorImageDidClickClosure?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named:"personalHeaderBackgoundImage")
        backgroundImage.isUserInteractionEnabled = true
        addSubview(backgroundImage)
        backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        mAvatorImageView = UIImageView()
        mAvatorImageView.isUserInteractionEnabled = true
        mAvatorImageView.layer.masksToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(avatorImageClick))
        mAvatorImageView.addGestureRecognizer(tap)
        mAvatorImageView.layer.cornerRadius = 40
        mAvatorImageView.kf.setImage(with: URL(string:"https://b-ssl.duitang.com/uploads/item/201609/04/20160904144136_zySJ3.thumb.700_0.jpeg"))
        backgroundImage.addSubview(mAvatorImageView)
        mAvatorImageView.snp.makeConstraints { (make) in
            make.center.equalTo(backgroundImage)
            make.size.equalTo(CGSize(width: 80, height: 80));
        }
        
        mNameLabel = UILabel()
        mNameLabel.text = "仓鼠大大"
        mNameLabel.textColor = UIColor.white
        mNameLabel.font = UIFont.systemFont(ofSize: 15)
        mNameLabel.textAlignment = .left
        backgroundImage.addSubview(mNameLabel)
        mNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(mAvatorImageView.snp.centerX)
            make.top.equalTo(mAvatorImageView.snp.bottom).offset(10);
        }
    }
    

    
    @objc func avatorImageClick() {
        mAvatorImageViewClickClourse?(mAvatorImageView)
    }
}

