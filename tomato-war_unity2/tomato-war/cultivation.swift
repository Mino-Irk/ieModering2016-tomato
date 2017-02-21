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
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    
    let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        let size:CGSize  = UIScreen.main.bounds.size
        
        label.textAlignment = .center
        label.text = getNowClockString() + "\n" + getNowClockString2()
        label.numberOfLines = 0
        label.font = UIFont(name: "AcademyEngravedLetPlain", size: 80)
        label.sizeToFit()
        if size.width < size.height {
            label.center = CGPoint(x: 400, y: 390)
        }else if size.width > size.height{
            label.center = CGPoint(x: 0, y: 0)
        }

        self.view.addSubview(label)
        
        
        var timer = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)

        
        
        
        // 画像の中心を画面の中心に設定
        
        if size.width < size.height {
            imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight - screenHeight/4))
        }else if size.width > size.height {
            imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight/3 - 50))
        }

        // UIImageViewのインスタンスをビューに追加
        view.addSubview(imageView)
    }

    // 画面表示するタイミングでリロードが入る
    //override func viewWillAppear(_ animated: Bool) {
    //}
    
    
    func update() {                     //時計
        // 画面の横幅を取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        let size:CGSize  = UIScreen.main.bounds.size
        
        if size.width < size.height {
            print ("Yes")
            imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight - screenHeight/4))
        }else if size.width > size.height {
            print ("No")
            imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight - screenHeight/3))
        }
        
        
        print(point)
        switch point {
        case 0...20:
            imageView.image = UIImage(named: "tomato_bird.png")
        case 30...70:
            imageView.image = UIImage(named: "tomato_rabbit.png")
        case 71...99:
            print("76〜99")
            imageView.image = UIImage(named: "tomato_fairy.png")
        case 100...200:
            print("100")
        default:
            print("その他")
        }

        
        
        label.textAlignment = .center
        label.text = getNowClockString() + "\n" + getNowClockString2()
        label.numberOfLines = 0
        label.font = UIFont(name: "AcademyEngravedLetPlain", size: 80)
        label.sizeToFit()
        if size.width < size.height {
            label.center = CGPoint(x: 400, y: 390)
        }else if size.width > size.height{
            label.center = CGPoint(x: screenWidth/2, y: screenHeight/4)
        }
        self.view.addSubview(label)
        
    }
    
    
    func getNowClockString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let now = Date()
        return formatter.string(from: now)
    }
    
    
    
    
    func getNowClockString2() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let now = Date()
        return formatter.string(from: now)
    }

}
