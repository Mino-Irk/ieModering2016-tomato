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
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        
        // 画像の中心を画面の中心に設定
        imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight - screenHeight/4))
        
        // UIImageViewのインスタンスをビューに追加
        view.addSubview(imageView)
    }

    // 画面表示するタイミングでリロードが入る
    override func viewWillAppear(_ animated: Bool) {

        switch point {
        case 0:
            imageView.image = UIImage(named: "flower.png")
        case 10:
            imageView.image = UIImage(named: "rabbit.png")
        case 76...99:
            print("76〜99")
        case 100:
            print("100")
        default:
            print("その他")
        }
    }
}
