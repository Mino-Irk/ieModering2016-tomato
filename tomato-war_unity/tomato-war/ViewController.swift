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

    @IBAction func prevlist(_ sender: UIStoryboardSegue) {
    }
    
    @IBAction func backlist(_ sender: UIStoryboardSegue) {
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
            cell.contentView.backgroundColor = #colorLiteral(red: 1, green: 0.8413158059, blue: 0.8469641805, alpha: 0.301958476)
        } else {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.8873918653, green: 0.8387421966, blue: 0.8471953869, alpha: 0.3017176798)
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

