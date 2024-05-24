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
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        self.navigationItem.leftBarButtonItem = cancelButton
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func cancelButtonTapped() {
        
    }
    
    @objc func doneButtonTapped() {
        
    }
}
