//
//  ViewController.swift
//  tomato-war
//
//  Created by minowaakari on 2017/01/31.
//  Copyright © 2017年 RyukyuUniversity. All rights reserved.
//

import Foundation
import UIKit

class cultivation: UIViewController{
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    
    let label = UILabel()
    let label2 = UILabel()

    let userDefaults = UserDefaults.standard
    

    @IBAction func resetButton(_ sender: Any) {
        point = 0
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let labelPoint = userDefaults.string(forKey: "labelPoint") {
            let points = Int(labelPoint)!
            point = points
        }
        
        
        
        
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
        
        
        label2.textAlignment = .center
        let point2 = String(point)
        label2.text = point2
        label2.numberOfLines = 0
        label2.font = UIFont(name: "AcademyEngravedLetPlain", size: 30)
        label2.sizeToFit()
        if size.width < size.height {
            label2.center = CGPoint(x: 80, y: 780)
        }else if size.width > size.height{
            label2.center = CGPoint(x: 80, y: 780)
        }
        
        self.view.addSubview(label2)
        
        
        
        
        var timer = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(cultivation.update), userInfo: nil, repeats: true)
        
        
        
        
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
            imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight - screenHeight/4))
        }else if size.width > size.height {
            imageView.center = CGPoint(x:screenWidth/2, y:(screenHeight - screenHeight/3))
        }
        
        print(point)
        switch point {
        case 0...20:
            imageView.image = UIImage(named: "buaisouna_tomato.png")
        case 30...70:
            imageView.image = UIImage(named: "tomato_defalt.png")
        case 71...99:
            print("76〜99")
            imageView.image = UIImage(named: "tomato_bird.png")
        case 100...150:
            print("100")
            imageView.image = UIImage(named: "tomato_rabbit.png")
        default:
            print("その他")
            imageView.image = UIImage(named: "tomato_fairy.png")
        }


        print ("Yes")
        userDefaults.set(point, forKey:"labelPoint")
        
        
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
        
        
        
        label2.textAlignment = .center
        let point2 = String(point)
        label2.text = point2
        label2.numberOfLines = 0
        label2.font = UIFont(name: "AcademyEngravedLetPlain", size: 30)
        label2.sizeToFit()
        if size.width < size.height {
            label2.center = CGPoint(x: 80, y: 780)
        }else if size.width > size.height{
            label2.center = CGPoint(x: 110, y: 590)
        }
        
        self.view.addSubview(label2)

        
        
        
        
        
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
