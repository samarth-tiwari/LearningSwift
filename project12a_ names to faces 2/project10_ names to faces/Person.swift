//
//  Person.swift
//  project10_ names to faces
//
//  Created by Samarth Tiwari on 10/08/22.
//

import UIKit

class Person: NSObject, NSCoding {
    var name: String
    var image: String
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(image, forKey: "image")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as? String ?? ""
        image = coder.decodeObject(forKey: "image") as? String ?? ""
    }
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
