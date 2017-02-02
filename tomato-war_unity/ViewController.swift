//
//  ViewController.swift
//  tomato-war
//
//  Created by minowaakari on 2017/01/31.
//  Copyright © 2017年 RyukyuUniversity. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController{
    
    // 画面が起動するときに動く関数
    // segueは毎回画面を作成する
    // pageViewControllerは作成しないためここが動かない
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(point)
        // pointはViewContorollers.swiftで宣言したグローバル変数,育成ポイントである
        // ポイントが10になったコンソール(右斜め下の枠)に出力する
        if (point == 10){
            print(point)
        }
    }
}
