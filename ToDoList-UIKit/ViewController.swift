//
//  ViewController.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "ToDo List"
        /// Navigation 타이틑 크게 설정
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        /// 할 일 추가 버튼
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
        
        /// 할 일 목록
        let tableView = UITableView(frame: self.view.bounds)
        
    }
    
    @objc func addButtonTapped() {
        let addToDoController = AddToDoViewController()
        /// 다음 화면 이동
        self.show(addToDoController, sender: nil)
    }


}

