//
//  AddToDoViewController.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import UIKit

/// 추가하는 데이터를 부모 뷰에 넘겨주기 위한 delegate
protocol AddToDoDelegate {
    func addToDo()
}

class AddToDoViewController: UIViewController {

    var delegate: AddToDoDelegate?
    
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
        
        /// 제약조건 설정
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
        guard let newToDo = textField.text, !newToDo.isEmpty else { return }
        /// 사용자 데이터에 할 일 추가(직접 접근해서 수정해야 데이터에 반영됨)
        ToDoStore.shared.addToDo(newToDo: UserDefaults(title: newToDo, completed: false))
        /// 부모 뷰에 전달
        delegate?.addToDo()
        self.navigationController?.popViewController(animated: true)
    }
    
}
