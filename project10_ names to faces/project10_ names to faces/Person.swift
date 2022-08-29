//
//  Person.swift
//  project10_ names to faces
//
//  Created by Samarth Tiwari on 10/08/22.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
