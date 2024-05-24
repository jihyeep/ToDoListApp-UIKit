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
    let toDoText = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
