//
//  LoginInputView.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class LoginInputView: UIView {

    public lazy var mImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var mNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .kContentColor
        return label
    }()
    
    public lazy var mTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    convenience init() {
        self.init(frame:CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mImageView)
        mImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self.snp.left).offset(10)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        addSubview(mNameLabel)
        mNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(mImageView.snp.right).offset(5)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 80, height: 30))
        }
        
        addSubview(mTextField)
        mTextField.snp.makeConstraints { (make) in
            make.left.equalTo(mNameLabel.snp.right).offset(5)
            make.centerY.equalTo(self)
            make.right.equalTo(self.snp.right).offset(-5)
            make.height.equalTo(30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
