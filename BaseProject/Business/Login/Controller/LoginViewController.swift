//
//  LoginViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 11/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UITextFieldDelegate {

    var mLoginView: LoginView!
    var mAccount: String {
        get {
            return mLoginView.mAccountTextField.mTextField.text!
        }
    }
    
    var mPasscode: String {
        get {
            return mLoginView.mPasscodeTextField.mTextField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mLoginView = LoginView(frame: view.frame)
        mLoginView.mAccountTextField.mTextField.delegate = self
        mLoginView.mPasscodeTextField.mTextField.delegate = self
        mLoginView.mLoginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        mLoginView.mCloseButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
        view.addSubview(mLoginView)
        KeyboardAvoiding.avoidingView = mLoginView.mInputView
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == mLoginView.mAccountTextField.mTextField {
            mLoginView.mPasscodeTextField.mTextField.becomeFirstResponder()
            return true
        } else {
            loginButtonAction()
            return true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc func loginButtonAction() {
        view.endEditing(true)
        print(mAccount + mPasscode)
    }
    

    @objc func closeButtonAction() {
        guard UserDefaults.standard.bool(forKey: kIsNotFirstLaunch) else {
            UserDefaults.standard.set(true, forKey: kIsNotFirstLaunch)
            AppDelegate.shared.buildKeyWindow()
            return
        }
        dismissVC(completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
