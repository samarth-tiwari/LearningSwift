//
//  Student.swift
//  Classroom
//
//  Created by Samarth Tiwari on 23/08/22.
//

import Foundation

class Student{
    private let name: String
    private let _class: Int
    private let age: Int
    private let img: String
    private let marks: Int
    
    init(name: String, age: Int, _class: Int, img: String, marks: Int) {
        self.name = name
        self._class = _class
        self.age = age
        self.img = img
        self.marks = marks
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getClass() -> Int {
        return self._class
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func getImageLocation() -> String {
        return self.img
    }
    
    func getMarks() -> Int {
        return self.marks
    }
}

extension Student: Equatable {
    static func ==(a: Student, b: Student) -> Bool {
        return a.name == b.name && a.age == b.age && a.marks == b.marks && a.img == b.img
    }
}
