//
//  http://iashchuk.com
//  WorkSheet.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 27/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
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
    var customerBillingAddress: String?
    var customerPhone: String?
    var customerMobile: String?
    var customerEmail: String

    //MARK: Job Properties

    var engineerName: String
    var jobType: String
    var applianceModel: String?
    var applianceMake: String?
    var burnerMake: String?
    var nozzleModel: String?
    var pumpPressureMetric: String?
    var pumpPressurePsi: Float?
    var pumpPressureBar: Float?
    var carbonDioxidePercentage: Float?
    var flueGasTemperature: Float?
    var efficiencyPercentage: Float?
    var carbonDioxideParts: Float?
    var oxygenPercentage: Float?
    var jobDescription: String?
    var jobUsedParts: String?
    var jobNotes: String?

    //MARK: Signature properties
    var engineerSignature: UIImage
    var customerSignature: UIImage
    
    //MARK: Email properties
    var emaiSenderProcess: Bool
    var emailSenderSuccess: Bool
    
//    var name: String
//    var photo: UIImage?
//    var rating: Int
    
    //MARK: Initialization
    
    init?(
        
        //        name: String, photo: UIImage?, rating: Int
        
        // Required data
        jobDate: Date,
        timeArrived: Date,
        timeLeft: Date,
        timeTravel: String,
        customerName: String,
        customerAddress: String,
        customerEmail: String,
        engineerName: String,
        jobType: String,
        engineerSignature: UIImage,
        customerSignature: UIImage,
        
        // Optional data
        customerBillingAddress: String?,
        customerPhone: String?,
        customerMobile: String?,
        applianceModel: String?,
        applianceMake: String?,
        burnerMake: String?,
        nozzleModel: String?,
        pumpPressureMetric: String?,
        pumpPressurePsi: Float?,
        pumpPressureBar: Float?,
        carbonDioxidePercentage: Float?,
        flueGasTemperature: Float?,
        efficiencyPercentage: Float?,
        carbonDioxideParts: Float?,
        oxygenPercentage: Float?,
        jobDescription: String?,
        jobUsedParts: String?,
        jobNotes: String?) {
    
        // The following fields must not be empty
        guard !customerName.isEmpty else {
            return nil
        }
        guard !customerAddress.isEmpty else {
            return nil
        }
        guard !customerEmail.isEmpty else {
            return nil
        }
        
        // The value must be between 0 and 5 inclusively
//        guard (rating >= 0) && (rating <= 5) else {
//            return nil
//        }
        
        // Initialize stored properties.
        
//        self.name = name
//        self.photo = photo
//        self.rating = rating
        
        self.jobDate = jobDate
        self.timeArrived = timeArrived
        self.timeLeft = timeLeft
        self.timeTravel = timeTravel
        self.customerName = customerName
        self.customerAddress = customerAddress
        self.customerBillingAddress = customerBillingAddress
        self.customerPhone = customerPhone
        self.customerMobile = customerMobile
        self.customerEmail = customerEmail
        self.engineerName = engineerName
        self.jobType = jobType
        self.applianceModel = applianceModel
        self.applianceMake = applianceMake
        self.burnerMake = burnerMake
        self.nozzleModel = nozzleModel
        self.pumpPressureMetric = pumpPressureMetric
        self.pumpPressurePsi = pumpPressurePsi
        self.pumpPressureBar = pumpPressureBar
        self.carbonDioxidePercentage = carbonDioxidePercentage
        self.flueGasTemperature = flueGasTemperature
        self.efficiencyPercentage = efficiencyPercentage
        self.carbonDioxideParts = carbonDioxideParts
        self.oxygenPercentage = oxygenPercentage
        self.jobDescription = jobDescription
        self.jobUsedParts = jobUsedParts
        self.jobNotes = jobNotes
        self.engineerSignature = engineerSignature
        self.customerSignature = customerSignature
        self.emaiSenderProcess = true
        self.emailSenderSuccess = false
        
    }
    
}
