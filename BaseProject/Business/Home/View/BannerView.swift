//
//  BannerView.swift
//  BaseProject
//
//  Created by 杨西川 on 13/08/2017.
//  Copyright © 2017 杨西川. All rights reserved.
//

import UIKit
import FSPagerView

class BannerView: UIView,FSPagerViewDelegate,FSPagerViewDataSource {

    var mDataArr:[String] = ["","",""] {
        didSet {
            self.mPageView.reloadData()
        }
    }
    var mPlaceHolderImage:[String] = ["banner_000","banner_001","banner_002"]
    
    lazy var mPageView: FSPagerView = {
        let pageView = FSPagerView()
//        pageView.transformer = FSPagerViewTransformer(type:.depth) // 切换动画
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pageView.delegate = self
        pageView.dataSource = self
        pageView.isInfinite = true
        return pageView
    }()
    
    lazy var mLineBackgroundView: UIView = {
        let bgView = UIView()
        bgView.backgroundColor = .kAppBaseColor
        return bgView
    }()
    
    lazy var mLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .kBannerLineColor
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mPageView)
        mPageView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-3)
        }
        
        addSubview(mLineBackgroundView)
        mLineBackgroundView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(mPageView.snp.bottom)
        }
        
        mLineBackgroundView.addSubview(mLineView)
        mLineView.snp.makeConstraints { (make) in
            make.left.bottom.top.equalTo(mLineBackgroundView)
            make.width.equalTo(kScreenWidth / CGFloat(mDataArr.count))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return mDataArr.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.kf.setImage(with: URL(string:mDataArr[index]), placeholder: UIImage(named:mPlaceHolderImage[index]), options: nil, progressBlock: nil, completionHandler: nil)
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        guard pagerView.scrollOffset.isNaN == false else {
            print("scrollOffSet is nil")
            return
        }
        let index = pagerView.scrollOffset
        let width = kScreenWidth / CGFloat(mDataArr.count)
        mLineView.snp.remakeConstraints({ (make) in
            make.width.equalTo(width)
            make.left.equalTo(self.mLineBackgroundView.snp.left).offset(index * width)
            make.top.bottom.equalTo(self.mLineBackgroundView)
        })
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        print(index)
    }
}
