//
//  http://iashchuk.com
//  Person.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 8/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit

/// This class defines the data that is stored for each person.
class Person {    
    // MARK: Properties

    var name: String?
    
    var image: UIImage?
    
    /// How much do they like dogs on a scale from 0 to 10.
    var addressCustomer: String?
    
    // MARK: Initialization
    
    init(name: String? = nil, image: UIImage? = nil, addressCustomer: String? = nil) {
        self.name = name
        self.image = image
        self.addressCustomer = addressCustomer
    }
}
