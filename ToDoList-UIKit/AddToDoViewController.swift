//
//  AddToDoViewController.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import UIKit

class AddToDoViewController: UIViewController {
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "ToDo:"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "여기에 할 일을 입력하세요"
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 17)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()

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
        
        self.view.addSubview(textLabel)
        self.view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            textField.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 270),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func cancelButtonTapped() {
        /// 이전 화면으로 이동
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonTapped() {
        
    }
    
}
