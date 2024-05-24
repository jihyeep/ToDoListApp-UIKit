//
//  ViewController.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/23/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let todos = UserDefaults.todos

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
        tableView.dataSource = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "todo")
        self.view.addSubview(tableView)
        
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as? ToDoTableViewCell else {
            fatalError("The dequeued cell is not an instance of ToDoTableViewCell.")
        }
        cell.todo = todos[indexPath.row]
        return cell
    }
    
    // MARK: - Methods
    @objc func addButtonTapped() {
        let addToDoController = AddToDoViewController()
        /// 다음 화면 이동
        self.show(addToDoController, sender: nil)
    }


}

