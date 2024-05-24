//
//  AddToDoViewController.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import UIKit

class AddToDoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.title = "Add ToDo"
        
        /// 취소 버튼
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        
        /// 확인 버튼
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func cancelButtonTapped() {
        /// 이전 화면으로 이동
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonTapped() {
        
    }
}
