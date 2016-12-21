//
//  ViewController.swift
//  tomato-war
//
//  Created by takematu ryo on 2016/12/11.
//  Copyright © 2016 RyukyuUniversity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var todolistTable: UITableView!

    // 起動時に呼ばれる関数
    override func viewDidLoad() {
        super.viewDidLoad()
        // AddToDo.swiftで保存したUserDefaultsの値を配列todoItemに格納する
        if UserDefaults.init().object(forKey: "todoList") != nil {
            todoItem = (UserDefaults.init().object(forKey: "todoList") as! [String])
        }
    }
    
    // Tableに表示する行数を指定する関数. 配列に入っている文字列の数をカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    // todoItemの値を各テーブルに表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cellValue .textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }
    
    // スライドすると一行削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoItem.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.init().set(todoItem, forKey: "todoList")
        }
    }
    
    // リストを下に引っ張って更新する機能. これ不必要かも
    override func viewDidAppear(_ animated: Bool) {
        todolistTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

