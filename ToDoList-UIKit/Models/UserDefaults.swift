//
//  UserDefaults.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import Foundation

struct UserDefaults: Identifiable, Codable{
    var id = UUID()
    var title: String
    var completed: Bool
}

extension UserDefaults {
    static var todos = [
        UserDefaults(title: "일어나기", completed: true),
        UserDefaults(title: "앱스쿨 보기", completed: false),
        UserDefaults(title: "밥먹기", completed: false),
        UserDefaults(title: "공부하기", completed: false),
        UserDefaults(title: "자기", completed: false)
    ]
}
