//
//  ViewController.swift
//  tomato-war
//
//  Created by takematu ryo on 2016/12/11.
//  Copyright © 2016 RyukyuUniversity. All rights reserved.
//

import UIKit

var point = 0 // 育成ポイント

class ViewControllers: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var todolistTable: UITableView!

    @IBAction func prevtodo(_ sender: UIStoryboardSegue) {
    }

        
    
    // 起動時に呼ばれる関数
    override func viewDidLoad() {
        super.viewDidLoad()
        // AddToDo.swiftで保存したUserDefaultsの値を配列todoItemに格納する
        if UserDefaults.init().object(forKey: "todoList") != nil {
            todoItem = (UserDefaults.init().object(forKey: "todoList") as! [String])
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if (indexPath.row % 2 == 0) {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.723267334, green: 0.9453228537, blue: 0.4824037952, alpha: 1)
        } else {
            cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.4746807218, blue: 0.4760116339, alpha: 1)
        }
    }

    // Tableに表示する行数を指定する関数. 配列に入っている文字列の数をカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    // todoItemの値を各テーブルに表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellValue = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell2")
        cellValue .textLabel?.text = todoItem[indexPath.row]
        return cellValue
    }
    
    // スライドすると一行削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoItem.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserDefaults.init().set(todoItem, forKey: "todoList")
            // とりあえず1タスクにつき10ポイント振っている
            point += 10
            print(point)
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

