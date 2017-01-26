//
//  AddToDo.swift
//  tomato-war
//
//  Created by takematu ryo on 2016/12/11.
//  Copyright © 2016 RyukyuUniversity. All rights reserved.
//

import UIKit

// ToDoアイテムを一旦保存するための配列. classをまたがるためclassの外で定義
var todoItem = [String]()

class AddToDo: UIViewController {

    @IBOutlet weak var itemText: UITextField!
    
    // 追加ボタンを押したときに,UserDefaultsに入力した文字を格納している
    @IBAction func addItem(_ sender: Any) {
        todoItem.append(itemText.text!)
        itemText.text = ""
        UserDefaults.init().set(todoItem, forKey: "todoList")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // returnキーを押すと,キーボードが下にさがる
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        itemText.resignFirstResponder()
        return true
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
