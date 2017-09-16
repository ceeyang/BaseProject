//
//  EditingTableViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 05/09/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit

class EditingTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(editEnable))
        navigationItem.rightBarButtonItem = rightBtn
        
        mTableView = UITableView(frame: view.frame)
        view.addSubview(mTableView)
        mTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        mTableView.rowHeight = 44
        mTableView.delegate = self
        mTableView.dataSource = self
        mTableView.allowsSelectionDuringEditing = true
        
    }
    
    @objc func editEnable() {
        mTableView.setEditing(!mTableView.isEditing, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension EditingTableViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        cell?.selectionStyle = .none
        cell?.backgroundColor = .random()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return  .insert
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

}
