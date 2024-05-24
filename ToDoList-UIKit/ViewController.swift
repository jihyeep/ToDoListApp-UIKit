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
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.rightBarButtonItem = addButton
        
    }
    
    @objc func addButtonTapped() {
        let addToDoController = AddToDoViewController()
        self.show(addToDoController, sender: nil)
    }


}

