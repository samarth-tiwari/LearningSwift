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
    
    init(name: String, age: Int, _class: Int, img: String) {
        self.name = name
        self._class = _class
        self.age = age
        self.img = img
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
}
