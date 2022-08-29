//
//  Todo+CoreDataProperties.swift
//  TodoList
//
//  Created by Samarth Tiwari on 02/08/22.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var body: String?
    @NSManaged public var createdAt: Date?
    
    func create(task text: String){
        body = text
        createdAt = Date()
    
    }
    func update(task: String){
        body = task
    }
}

extension Todo : Identifiable {

}
