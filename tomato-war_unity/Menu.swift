//
//  Menu.swift
//  tomato-war
//
//  Created by minowaakari on 2017/01/31.
//  Copyright © 2017年 RyukyuUniversity. All rights reserved.
//

import Foundation
import UIKit

class Menu: UIViewController{
    
    // ContainerView に Embed した UIPageViewController のインスタンスを保持する
    var pageViewController: UIPageViewController?
    
    // ページングして表示させる ViewControllerを保持する
    var vcArray = [ViewControllers]() //todo画面
    var vrArray = [Calendars]()       //カレンダー
    var vaArray = [TimeTable]()       //時間割
    var vtArray = [ViewController]()  //育成画面
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Storyboard 上に配置した ViewController(StoryboardID = DataViewController) をインスタンス化して配列に追加する
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewControllers") as! ViewControllers
        vcArray.append(vc)
        
        
        let vr = storyboard?.instantiateViewController(withIdentifier: "Calendars") as!Calendars
        vrArray.append(vr)
        
        let va = storyboard?.instantiateViewController(withIdentifier: "TimeTable") as!TimeTable
        vaArray.append(va)
        
        let vt = storyboard?.instantiateViewController(withIdentifier: "ViewController") as!ViewController
        vtArray.append(vt)
        
        // ContainerView に Embed した UIPageViewController を取得する
        pageViewController = childViewControllers[0] as? UIPageViewController
        
        // dataSource を設定する
        //pageViewController!.dataSource = self
        
        // 最初に表示する画面として配列の先頭の ViewController を設定する
        pageViewController!.setViewControllers([vtArray[0]], direction: .forward, animated: false, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ボタンがタップされたらそれぞれ 0ページ、5ページ、9ページ目にジャンプさせる
    @IBAction func ToCultivation(_ sender: UIButton) {
        pageViewController!.setViewControllers([vtArray[0]], direction: .forward, animated: false, completion: nil)
    }
    
    @IBAction func ToTodo(_ sender: UIButton) {
        pageViewController!.setViewControllers([vcArray[0]], direction: .forward, animated: false, completion: nil)
    }
    
    @IBAction func ToCalendar(_ sender: UIButton) {
        pageViewController!.setViewControllers([vrArray[0]], direction: .forward, animated: false, completion: nil)
    }
    
    @IBAction func ToTimetable(_ sender: UIButton) {
        pageViewController!.setViewControllers([vaArray[0]], direction: .forward, animated: false, completion: nil)
    }
    
}
