//
//  ToDoStore.swift
//  ToDoList-UIKit
//
//  Created by 박지혜 on 5/24/24.
//

import UIKit

class ToDoStore {
    static let shared = ToDoStore()
    private var todos: [UserDefaults]
    
    private init() {
        todos = []
    }
    
    func numberOfToDos() -> Int {
        return todos.count
    }
    
    func getToDo(index: Int) -> UserDefaults {
        return todos[index]
    }
    
    func getAllToDos() -> [UserDefaults] {
        return todos
        
    }
    
    func addToDo(newToDo: UserDefaults) {
        todos.append(newToDo)
    }
    
    func deleteToDo(index: Int) {
        todos.remove(at: index)
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadToDoData() {
        let filePath = getDocumentDirectory().appendingPathComponent("ToDoData.json")
        do {
            let data = try Data(contentsOf: filePath)
            let toDoData = try JSONDecoder().decode([UserDefaults].self, from: data)
            todos = toDoData
        } catch {
            print("Failed to read JSON data: \(error.localizedDescription)")
        }
    }
    
    func saveToDoData() {
        let directoryPath = getDocumentDirectory()
        try? FileManager.default.createDirectory(at: directoryPath, withIntermediateDirectories: true)
        let filePath = directoryPath.appendingPathComponent("ToDoData.json")
        let json = try? JSONEncoder().encode(todos)
        do {
            try json!.write(to: filePath)
        } catch {
            print("Failed to write JSON data: \(error.localizedDescription)")
        }
    }
    
    
}
