//
//  WorkSheet.swift
//  PlumberSheet
//
//  Created by Alexander Iashchuk on 29/11/17.
//  Copyright © 2017 Alexander Iashchuk. All rights reserved.
//

import UIKit

class WorkSheet {
    
    //MARK: Job Time Properties
    
    var jobDate: Date
    var timeArrived: Date
    var timeLeft: Date
    var timeTravel: String
    
    //MARK: Customer Properties
    
    var customerName: String
    var customerAddress: String
    var customerBilling: Bool
    var customerBillingAddress: String
    var customerPhone: String
    var customerMobile: String
    var customerEmail: String
    
    //MARK: Job Properties
    
    var engineerName: String
    var jobType: String
    var applianceModel: String
    var applianceMake: String
    var burnerMake: String
    var nozzleModel: String
    var pumpPressure: Float
    var carbonDioxidePercentage: Float
    var flueGasTemperature: Float
    var efficiencyPercentage: Float
    var carbonDioxideParts: Float
    var oxygenPercentage: Float
    var jobDescription: String
    var jobUsedParts: String
    var jobNotes: String
    
    //MARK: Signature properties
//    var engineerSignature: UIImage
//    var customerSignature: UIImage
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
    
}
