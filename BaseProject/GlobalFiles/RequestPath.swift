//
//  RULFile.swift
//  ZhiXueYun
//
//  Created by pro on 16/4/25.
//  Copyright © 2016年 zhixueyun. All rights reserved.
//

import Foundation

let KiOSVersionURL = "http://demo.zhixueyun.com/app-new1/update-date.json"
let KiOSCONFIGURL  = "http://demo.zhixueyun.com/app-new1/ios-config.json"


//let BaseURLStr     = "http://demo.zhixueyun.com/mlds/"
//let BaseURLStr     = "http://tc.zhixueyun.com/zxy-mobile-new/"
//let BaseURLStr     = "http://192.168.3.223:8081/zxy-mobile-new/"
let BaseURLStr     = "http://dl.zhixueyun.com/zxy-mobile-new/"

//MARK: - Home -
let URL_HomeLayout = BaseURLStr + "sys/loadIndexLayout"

//MARK: - News -
let URL_News        = BaseURLStr + "news/newsList"

//MARK: - Course -
let URL_CourseNewData  = BaseURLStr + "course/newestList"
let URL_CourseHotData  = BaseURLStr + "course/hotestList"
let URL_CourseCategory = BaseURLStr + "course/category"
let URL_CourseDetail   = BaseURLStr + "course/scorm/scormCategoryList"


//MARK: - Login && Register -
let URL_Login        = BaseURLStr + "user/login"


//MARK: - My View -
let URL_MyCountData = BaseURLStr + "user/personalInfo"


//MARK: - Message -
let URL_MessageData   = BaseURLStr + "user/messageList"
let URL_MessageDetail = BaseURLStr + "user/messageDetail"


//MARK: - Doc -
let URL_DocHotestList = BaseURLStr + "doc/hotestList"
let URL_DocNewestList = BaseURLStr + "doc/newestList"
let URL_DocCategory   = BaseURLStr + "doc/category"
let URL_DocDetail     = BaseURLStr + "doc/docDetail"

