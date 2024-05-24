//
//  ViewController.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/23/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddToDoDelegate {
    
    lazy var tableView = UITableView()
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        ToDoStore.shared.loadToDoData()
    }

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
        tableView = .init(frame: self.view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "todo")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoStore.shared.numberOfToDos()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as? ToDoTableViewCell else {
            fatalError("The dequeued cell is not an instance of ToDoTableViewCell.")
        }
        /// 사용자 데이터 셀에 넣기
        cell.todo = ToDoStore.shared.getToDo(index: indexPath.row)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteToDo(indexPath: indexPath)
        }
    }
    
    // MARK: - AddToDoDelegate
    func addToDo(toDoItem: UserDefaults) {
        /// 사용자 데이터에 할 일 추가
        ToDoStore.shared.addToDo(newToDo: toDoItem)
        ToDoStore.shared.saveToDoData()
        tableView.reloadData()
    }
    
    // MARK: - Methods
    @objc func addButtonTapped() {
        let addToDoController = AddToDoViewController()
        addToDoController.delegate = self
        /// 다음 화면 이동
        self.show(addToDoController, sender: nil)
    }
    
    func deleteToDo(indexPath: IndexPath) {
        /// 사용자 데이터에서 할 일 삭제
        ToDoStore.shared.deleteToDo(index: indexPath.row)
        ToDoStore.shared.saveToDoData()
        tableView.reloadData()
    }


}

