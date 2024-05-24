//
//  ToDoTableViewCell.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    /// 체크박스 버튼
    let checkboxButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "square")
        
        let button = UIButton()
        button.configuration = config
        button.addAction(UIAction { _ in
            if button.configuration?.image == UIImage(systemName: "square") {
                button.configuration?.image = UIImage(systemName: "checkmark.square")
            } else {
                button.configuration?.image = UIImage(systemName: "square")
            }
        }, for: .touchUpInside)
        
        return button
    }()
    
    /// 할 일 제목
    let toDoTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        
        return label
    }()
    
    /// 셀에 뷰 추가 및 제약조건 설정 초기화
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(checkboxButton)
        addSubview(toDoTitle)
        
        checkboxButton.translatesAutoresizingMaskIntoConstraints = false
        toDoTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkboxButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            checkboxButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 30),
            checkboxButton.heightAnchor.constraint(equalToConstant: 30),
            
            toDoTitle.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor, constant: 10),
            toDoTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            toDoTitle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
