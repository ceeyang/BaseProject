//
//  LoginView.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit
import VisualEffectView

class LoginView: UIView {

    //懒加载初始化控件
    lazy var mBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"BackgroundImage_About")
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    public lazy var mAvatorImageView: UIImageView = {
        let avator = UIImageView()
        avator.backgroundColor = .white
        avator.layer.masksToBounds = true
        avator.layer.cornerRadius = 60
        return avator
    }()
    
    public lazy var mInputView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var mAccountTextField: LoginInputView = {
        let textField = LoginInputView()
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .kAppBaseColor
        textField.mTextField.returnKeyType = .next
        textField.mNameLabel.text = """
        工号/账号:
        """
        return textField
    }()
    
    public lazy var mPasscodeTextField: LoginInputView = {
        let textField = LoginInputView()
        textField.backgroundColor = .kAppBaseColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        textField.mTextField.isSecureTextEntry = true
        textField.mTextField.returnKeyType = .done
        textField.mNameLabel.text = """
          密     码  :
        """
        return textField
    }()
    
    public lazy var mLoginButton: UIButton = {
        let loginBtn = UIButton()
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.setBackgroundColor(.kNavigationBarColor, forState: .normal)
        loginBtn.layer.masksToBounds = true
        loginBtn.layer.cornerRadius = 5
        return loginBtn
    }()
    
    
    lazy var mCompanyInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .kNavigationBarColor
        label.numberOfLines = 0
        label.text = "深圳市源泰达科技有限公司"
        return label
    }()
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        /* background imageView */
        addSubview(mBackgroundImageView)
        let visualEffectView = VisualEffectView(frame: frame)
        visualEffectView.colorTint = .white
        visualEffectView.colorTintAlpha = 0.2
        visualEffectView.blurRadius = 1
        visualEffectView.scale = 1
        mBackgroundImageView.addSubview(visualEffectView)
        mBackgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        /* Avator ImageView */
        mBackgroundImageView.addSubview(mAvatorImageView)
        mAvatorImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(mBackgroundImageView)
            make.top.equalTo(mBackgroundImageView.snp.top).offset(80)
            make.size.equalTo(CGSize(width: 120, height: 120))
        }
        
        mBackgroundImageView.addSubview(mInputView)
        mInputView.snp.makeConstraints { (make) in
            make.centerX.equalTo(mBackgroundImageView)
            make.centerY.equalTo(mBackgroundImageView.snp.centerY).offset(20)
            make.size.equalTo(CGSize(width: kScreenWidth, height: 205))
        }
        
        /* Account */
        mInputView.addSubview(mAccountTextField)
        mAccountTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(mInputView)
            make.width.equalTo(kScreenWidth - 60)
            make.height.equalTo(55)
            make.top.equalTo(mInputView.snp.top)
        }
        
        /* Passcode */
        mInputView.addSubview(mPasscodeTextField)
        mPasscodeTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(mInputView)
            make.width.equalTo(kScreenWidth - 60)
            make.height.equalTo(55)
            make.top.equalTo(mAccountTextField.snp.bottom).offset(20)
        }
        
        /* Login Button */
        mInputView.addSubview(mLoginButton)
        mLoginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(mInputView)
            make.width.equalTo(kScreenWidth - 60)
            make.height.equalTo(55)
            make.top.equalTo(mPasscodeTextField.snp.bottom).offset(20)
        }
        
        /* Company information label */
        mBackgroundImageView.addSubview(mCompanyInfoLabel)
        mCompanyInfoLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(mBackgroundImageView)
            make.bottom.equalTo(mBackgroundImageView.snp.bottom).offset(-40)
        }
    }
    
}
