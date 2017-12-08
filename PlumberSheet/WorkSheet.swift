//
//  http://iashchuk.com
//  WorkSheet.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 27/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//


import UIKit
import os.log

class WorkSheet: NSObject, NSCoding {
    
    //MARK: Properties
    
    var jobDate: String
    var timeArrived: String
    var timeLeft: String
    var timeTravel: String
    var customerName: String
    var customerAddress: String
    var customerBillingAddress: String
    var customerPhone: String
    var customerMobile: String
    var customerEmail: String
    var engineerName: String
    var jobType: String
    var applianceModel: String
    var applianceMake: String
    var burnerMake: String
    var nozzleModel: String
    var pumpPressureMetric: String
    var pumpPressurePsi: Float
    var pumpPressureBar: Float
    var carbonDioxidePercentage: Float
    var flueGasTemperature: Float
    var efficiencyPercentage: Float
    var carbonDioxideParts: Float
    var oxygenPercentage: Float
    var jobDescription: String
    var jobUsedParts: String
    var jobNotes: String
    var engineerSignature: UIImage
    var customerSignature: UIImage
    var emaiSenderProcess: Bool
    var emailSenderSuccess: Bool
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("jobs")
    
    //MARK: Types
    
    struct PropertyKey {
        static let jobDate = "jobDate"
        static let timeArrived = "timeArrived"
        static let timeLeft = "timeLeft"
        static let timeTravel = "timeTravel"
        static let customerName = "customerName"
        static let customerAddress = "customerAddress"
        static let customerEmail = "customerEmail"
        static let engineerName = "engineerName"
        static let jobType = "jobType"
        static let customerBillingAddress = "customerBillingAddress"
        static let customerPhone = "customerPhone"
        static let customerMobile = "customerMobile"
        static let applianceModel = "applianceModel"
        static let applianceMake = "applianceMake"
        static let burnerMake = "burnerMake"
        static let nozzleModel = "nozzleModel"
        static let pumpPressureMetric = "pumpPressureMetric"
        static let pumpPressurePsi = "pumpPressurePsi"
        static let pumpPressureBar = "pumpPressureBar"
        static let carbonDioxidePercentage = "carbonDioxidePercentage"
        static let flueGasTemperature = "flueGasTemperature"
        static let efficiencyPercentage = "efficiencyPercentage"
        static let carbonDioxideParts = "carbonDioxideParts"
        static let oxygenPercentage = "oxygenPercentage"
        static let jobDescription = "jobDescription"
        static let jobUsedParts = "jobUsedParts"
        static let jobNotes = "jobNotes"
        static let engineerSignature = "engineerSignature"
        static let customerSignature = "customerSignature"
        static let emaiSenderProcess = "emaiSenderProcess"
        static let emailSenderSuccess = "emailSenderSuccess"
    }
    
    //MARK: Initialization
    
    init?(
        // Initializing work sheet object
        jobDate: String,
        timeArrived: String,
        timeLeft: String,
        timeTravel: String,
        customerName: String,
        customerAddress: String,
        customerEmail: String,
        engineerName: String,
        jobType: String,
        customerBillingAddress: String,
        customerPhone: String,
        customerMobile: String,
        applianceModel: String,
        applianceMake: String,
        burnerMake: String,
        nozzleModel: String,
        pumpPressureMetric: String,
        pumpPressurePsi: Float,
        pumpPressureBar: Float,
        carbonDioxidePercentage: Float,
        flueGasTemperature: Float,
        efficiencyPercentage: Float,
        carbonDioxideParts: Float,
        oxygenPercentage: Float,
        jobDescription: String,
        jobUsedParts: String,
        jobNotes: String,
        engineerSignature: UIImage,
        customerSignature: UIImage,
        emaiSenderProcess: Bool?,
        emailSenderSuccess: Bool?) {
        
        // Initializing stored properties
        self.jobDate = jobDate
        self.timeArrived = timeArrived
        self.timeLeft = timeLeft
        self.timeTravel = timeTravel
        self.customerName = customerName
        self.customerAddress = customerAddress
        self.customerEmail = customerEmail
        self.engineerName = engineerName
        self.jobType = jobType
        self.customerBillingAddress = customerBillingAddress
        self.customerPhone = customerPhone
        self.customerMobile = customerMobile
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
        self.emaiSenderProcess = emaiSenderProcess ?? true
        self.emailSenderSuccess = emailSenderSuccess ?? false
    }
    
    //MARK: NSCoding function
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(jobDate, forKey: PropertyKey.jobDate)
        aCoder.encode(timeArrived, forKey: PropertyKey.timeArrived)
        aCoder.encode(timeLeft, forKey: PropertyKey.timeLeft)
        aCoder.encode(timeTravel, forKey: PropertyKey.timeTravel)
        aCoder.encode(customerName, forKey: PropertyKey.customerName)
        aCoder.encode(customerAddress, forKey: PropertyKey.customerAddress)
        aCoder.encode(customerEmail, forKey: PropertyKey.customerEmail)
        aCoder.encode(engineerName, forKey: PropertyKey.engineerName)
        aCoder.encode(jobType, forKey: PropertyKey.jobType)
        aCoder.encode(customerBillingAddress, forKey: PropertyKey.customerBillingAddress)
        aCoder.encode(customerPhone, forKey: PropertyKey.customerPhone)
        aCoder.encode(customerMobile, forKey: PropertyKey.customerMobile)
        aCoder.encode(applianceModel, forKey: PropertyKey.applianceModel)
        aCoder.encode(applianceMake, forKey: PropertyKey.applianceMake)
        aCoder.encode(burnerMake, forKey: PropertyKey.burnerMake)
        aCoder.encode(nozzleModel, forKey: PropertyKey.nozzleModel)
        aCoder.encode(pumpPressureMetric, forKey: PropertyKey.pumpPressureMetric)
        aCoder.encode(pumpPressurePsi, forKey: PropertyKey.pumpPressurePsi)
        aCoder.encode(pumpPressureBar, forKey: PropertyKey.pumpPressureBar)
        aCoder.encode(carbonDioxidePercentage, forKey: PropertyKey.carbonDioxidePercentage)
        aCoder.encode(flueGasTemperature, forKey: PropertyKey.flueGasTemperature)
        aCoder.encode(efficiencyPercentage, forKey: PropertyKey.efficiencyPercentage)
        aCoder.encode(carbonDioxideParts, forKey: PropertyKey.carbonDioxideParts)
        aCoder.encode(oxygenPercentage, forKey: PropertyKey.oxygenPercentage)
        aCoder.encode(jobDescription, forKey: PropertyKey.jobDescription)
        aCoder.encode(jobUsedParts, forKey: PropertyKey.jobUsedParts)
        aCoder.encode(jobNotes, forKey: PropertyKey.jobNotes)
        aCoder.encode(engineerSignature, forKey: PropertyKey.engineerSignature)
        aCoder.encode(customerSignature, forKey: PropertyKey.customerSignature)
        aCoder.encode(emaiSenderProcess, forKey: PropertyKey.emaiSenderProcess)
        aCoder.encode(emailSenderSuccess, forKey: PropertyKey.emailSenderSuccess)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let jobDate = aDecoder.decodeObject(forKey: PropertyKey.jobDate) as! String
        let timeArrived = aDecoder.decodeObject(forKey: PropertyKey.timeArrived) as! String
        let timeLeft = aDecoder.decodeObject(forKey: PropertyKey.timeLeft) as! String
        let timeTravel = aDecoder.decodeObject(forKey: PropertyKey.timeTravel) as! String
        let customerName = aDecoder.decodeObject(forKey: PropertyKey.customerName) as! String
        let customerAddress = aDecoder.decodeObject(forKey: PropertyKey.customerAddress) as! String
        let customerEmail = aDecoder.decodeObject(forKey: PropertyKey.customerEmail) as! String
        let engineerName = aDecoder.decodeObject(forKey: PropertyKey.engineerName) as! String
        let jobType = aDecoder.decodeObject(forKey: PropertyKey.jobType) as! String
        let customerBillingAddress = aDecoder.decodeObject(forKey: PropertyKey.customerBillingAddress) as! String
        let customerPhone = aDecoder.decodeObject(forKey: PropertyKey.customerPhone) as! String
        let customerMobile = aDecoder.decodeObject(forKey: PropertyKey.customerMobile) as! String
        let applianceModel = aDecoder.decodeObject(forKey: PropertyKey.applianceModel) as! String
        let applianceMake = aDecoder.decodeObject(forKey: PropertyKey.applianceMake) as! String
        let burnerMake = aDecoder.decodeObject(forKey: PropertyKey.burnerMake) as! String
        let nozzleModel = aDecoder.decodeObject(forKey: PropertyKey.nozzleModel) as! String
        let pumpPressureMetric = aDecoder.decodeObject(forKey: PropertyKey.pumpPressureMetric) as! String
        let pumpPressurePsi = aDecoder.decodeFloat(forKey: PropertyKey.pumpPressurePsi)
        let pumpPressureBar = aDecoder.decodeFloat(forKey: PropertyKey.pumpPressureBar)
        let carbonDioxidePercentage = aDecoder.decodeFloat(forKey: PropertyKey.carbonDioxidePercentage)
        let flueGasTemperature = aDecoder.decodeFloat(forKey: PropertyKey.flueGasTemperature)
        let efficiencyPercentage = aDecoder.decodeFloat(forKey: PropertyKey.efficiencyPercentage)
        let carbonDioxideParts = aDecoder.decodeFloat(forKey: PropertyKey.carbonDioxideParts)
        let oxygenPercentage = aDecoder.decodeFloat(forKey: PropertyKey.oxygenPercentage)
        let jobDescription = aDecoder.decodeObject(forKey: PropertyKey.jobDescription) as! String
        let jobUsedParts = aDecoder.decodeObject(forKey: PropertyKey.jobUsedParts) as! String
        let jobNotes = aDecoder.decodeObject(forKey: PropertyKey.jobNotes) as! String
        let engineerSignature = aDecoder.decodeObject(forKey: PropertyKey.engineerSignature) as! UIImage
        let customerSignature = aDecoder.decodeObject(forKey: PropertyKey.customerSignature) as! UIImage
        let emaiSenderProcess = aDecoder.decodeBool(forKey: PropertyKey.emaiSenderProcess)
        let emailSenderSuccess = aDecoder.decodeBool(forKey: PropertyKey.emailSenderSuccess)
        
        // Must call designated initializer.
        self.init(jobDate: jobDate, timeArrived: timeArrived, timeLeft: timeLeft, timeTravel: timeTravel, customerName: customerName, customerAddress: customerAddress, customerEmail: customerEmail, engineerName: engineerName, jobType: jobType, customerBillingAddress: customerBillingAddress, customerPhone: customerPhone, customerMobile: customerMobile, applianceModel: applianceModel, applianceMake: applianceMake, burnerMake: burnerMake, nozzleModel: nozzleModel, pumpPressureMetric: pumpPressureMetric, pumpPressurePsi: pumpPressurePsi, pumpPressureBar: pumpPressureBar, carbonDioxidePercentage: carbonDioxidePercentage, flueGasTemperature: flueGasTemperature, efficiencyPercentage: efficiencyPercentage, carbonDioxideParts: carbonDioxideParts, oxygenPercentage: oxygenPercentage, jobDescription: jobDescription, jobUsedParts: jobUsedParts, jobNotes: jobNotes, engineerSignature: engineerSignature, customerSignature: customerSignature, emaiSenderProcess: emaiSenderProcess, emailSenderSuccess: emailSenderSuccess)
    }
    
}
