//
//  UserDefaults.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import Foundation

struct UserDefaults: Identifiable{
    var id = UUID()
    var title: String
    var completed: Bool
}

extension UserDefaults {
    static let tasks = ["일어나기", "앱스쿨 보기", "밥먹기", "공부하기", "자기"]
}
