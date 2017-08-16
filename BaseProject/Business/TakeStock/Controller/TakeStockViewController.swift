//
//  TakeStockViewController.swift
//  BaseProject
//
//  Created by 杨西川 on 14/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit
import BetterSegmentedControl

class TakeStockViewController: UIViewController,UIScrollViewDelegate {
    
    lazy var mSegmentControl: BetterSegmentedControl = {
        let indicatorControl = BetterSegmentedControl(
            frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: 44),
            titles: ["已有盘点(0)", "新增盘点"],
            index: 0,
            backgroundColor: .white,
            titleColor: .kTitleColor,
            indicatorViewBackgroundColor: .white,
            selectedTitleColor: .kNavigationBarColor)
        indicatorControl.autoresizingMask = [.flexibleWidth]
        indicatorControl.bouncesOnChange = false
        indicatorControl.panningDisabled = false
        indicatorControl.addTarget(self, action: #selector(segmentControlValueChanged(_:)), for: .valueChanged)
        let customSubview = UIView(frame: CGRect(x: 0, y: 39, width: 200, height: 2.0))
        customSubview.backgroundColor = .kNavigationBarColor
        customSubview.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        indicatorControl.addSubviewToIndicator(customSubview)
        return indicatorControl
    }()
    
    lazy var mScorllView: UIScrollView = {
        // 留下1像素的边距，让父视图能够响应滑动返回手势
        let scrollView = UIScrollView(frame: CGRect(x: 1, y: 108, w: kScreenWidth-1, h: kScreenHeight - 108))
        scrollView.backgroundColor = .kAppBaseColor
        scrollView.contentSize = CGSize(width: kScreenWidth * 2, height: 0)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    var mHadTakedStockViewController: HadTakedStockViewController!
    var mNewTakeStockViewController: NewTakeStockViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sethNavigationBarTitle(titleString: "设备盘点", withSearchBar: true)
        view.backgroundColor = .kAppBaseColor
        
        view.addSubview(mSegmentControl)
        view.addSubview(mScorllView)
        
        mHadTakedStockViewController = HadTakedStockViewController()
        addChildViewController(mHadTakedStockViewController)
        mScorllView.addSubview(mHadTakedStockViewController.view)
        mHadTakedStockViewController.view.snp.makeConstraints { (make) in
            make.left.top.equalTo(mScorllView)
            make.height.equalTo(kScreenHeight - 108)
            make.width.equalTo(kScreenWidth)
        }
        
        mNewTakeStockViewController = NewTakeStockViewController()
        addChildViewController(mNewTakeStockViewController)
        mScorllView.addSubview(mNewTakeStockViewController.view)
        mNewTakeStockViewController.view.snp.makeConstraints { (make) in
            make.left.equalTo(mScorllView.snp.left).offset(kScreenWidth)
            make.top.equalTo(mScorllView)
            make.height.equalTo(kScreenHeight - 108)
            make.width.equalTo(kScreenWidth)
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = (scrollView.contentOffset.x + 100 ) / kScreenWidth
        try! mSegmentControl.setIndex(UInt(index), animated: true)
    }
    
    
    @objc func segmentControlValueChanged(_ segment:BetterSegmentedControl) {
        let index: CGFloat = CGFloat(segment.index)
        print(index)
        mScorllView.setContentOffset(CGPoint(x:kScreenWidth * index, y:0), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
