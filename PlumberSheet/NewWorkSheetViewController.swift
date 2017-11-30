//
//  http://iashchuk.com
//  NewWorkSheetViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 3/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit
import Eureka
import os.log

class NewWorkSheetViewController: FormViewController {
    
    /*
     This value is either passed by `JobTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new work sheet.
     */
    var workSheet: WorkSheet?
    
    //MARK: Save Work Sheet Button
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    private func updateSaveButtonState() {
        
        // Disable the Save button if the text field is empty.
        
        let value1 = form.values()["CustomerName"] as? String ?? ""
        let value2 = form.values()["CustomerAddress"] as? String ?? ""
        let value3 = form.values()["CustomerEmail"] as? String ?? ""
        saveButton.isEnabled = !value1.isEmpty && !value2.isEmpty && !value3.isEmpty
    }
    
    //MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            if #available(iOS 10.0, *) {
                os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return
        }
        
        // Formating date values to text strings
        let formatterDate = DateFormatter()
        let formatterTime = DateFormatter()
        formatterDate.dateFormat = "dd.MM.yyyy"
        formatterTime.dateFormat = "HH:mm a"
        
        let formjobDate = formatterDate.string(from: form.values()["JobDate"] as! Date)
        let formtimeArrived = formatterTime.string(from: form.values()["TimeArrived"] as! Date)
        let formtimeLeft = formatterTime.string(from: form.values()["TimeLeft"] as! Date)
        let formtimeTravel = form.values()["TimeTravel"] as? String ?? "DEFAULT"
        let formcustomerName = form.values()["CustomerName"] as? String ?? "DEFAULT"
        let formcustomerAddress = form.values()["CustomerAddress"] as? String ?? "DEFAULT"
        let formcustomerEmail = form.values()["CustomerEmail"] as? String ?? "DEFAULT"
        let formengineerName = form.values()["EngineerName"] as? String ?? "DEFAULT"
        let formjobType = form.values()["JobType"] as? String ?? "DEFAULT"
        let formcustomerBillingAddress = form.values()["CustomerBillingAddress"] as? String ?? "DEFAULT"
        let formcustomerPhone = form.values()["CustomerPhone"] as? String ?? "DEFAULT"
        let formcustomerMobile = form.values()["CustomerMobile"] as? String ?? "DEFAULT"
        let formapplianceModel = form.values()["ApplianceModel"] as? String ?? "DEFAULT"
        let formapplianceMake = form.values()["ApplianceMake"] as? String ?? "DEFAULT"
        let formburnerMake = form.values()["BurnerMake"] as? String ?? "DEFAULT"
        let formnozzleModel = form.values()["NozzleModel"] as? String ?? "DEFAULT"
        let formpumpPressureMetric = form.values()["PumpPressureMetric"] as? String ?? "DEFAULT"
        let formpumpPressurePsi = form.values()["PumpPressurePsi"] as? Float ?? 9696
        let formpumpPressureBar = form.values()["PumpPressureBar"] as? Float ?? 9696
        let formcarbonDioxidePercentage = form.values()["CarbonDioxidePercentage"] as? Float ?? 9696
        let formflueGasTemperature = form.values()["FlueGasTemperature"] as? Float ?? 9696
        let formefficiencyPercentage = form.values()["EfficiencyPercentage"] as? Float ?? 9696
        let formcarbonDioxideParts = form.values()["CarbonDioxideParts"] as? Float ?? 9696
        let formoxygenPercentage = form.values()["OxygenPercentage"] as? Float ?? 9696
        let formjobDescription = form.values()["JobDescription"] as? String ?? "DEFAULT"
        let formjobUsedParts = form.values()["JobUsedParts"] as? String ?? "DEFAULT"
        let formjobNotes = form.values()["JobNotes"] as? String ?? "DEFAULT"
        
        // Set the work sheet to be passed to JobTableViewController after the unwind segue.
        workSheet = WorkSheet(
                              jobDate: formjobDate,
                              timeArrived: formtimeArrived,
                              timeLeft: formtimeLeft,
                              timeTravel: formtimeTravel,
                              customerName: formcustomerName,
                              customerAddress: formcustomerAddress,
                              customerEmail: formcustomerEmail,
                              engineerName: formengineerName,
                              jobType: formjobType,
                              customerBillingAddress: formcustomerBillingAddress,
                              customerPhone: formcustomerPhone,
                              customerMobile: formcustomerMobile,
                              applianceModel: formapplianceModel,
                              applianceMake: formapplianceMake,
                              burnerMake: formburnerMake,
                              nozzleModel: formnozzleModel,
                              pumpPressureMetric: formpumpPressureMetric,
                              pumpPressurePsi: formpumpPressurePsi,
                              pumpPressureBar: formpumpPressureBar,
                              carbonDioxidePercentage: formcarbonDioxidePercentage,
                              flueGasTemperature: formflueGasTemperature,
                              efficiencyPercentage: formefficiencyPercentage,
                              carbonDioxideParts: formcarbonDioxideParts,
                              oxygenPercentage: formoxygenPercentage,
                              jobDescription: formjobDescription,
                              jobUsedParts: formjobUsedParts,
                              jobNotes: formjobNotes,
                              engineerSignature: UIImage(named: "Header")!,
                              customerSignature: UIImage(named: "Header")!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section() {
            $0.header = HeaderFooterView<HeaderView>(.class)
            }
            
            +++ Section("General info:")
            <<< DateRow("JobDate"){
                $0.title = "Job Date"
                $0.value = Date.init()
            }
            <<< PickerInputRow<String>("EngineerName"){
                $0.title = "Engineer"
                $0.options = ["Mark Whittaker", "Scott Chadwick", "Ben Reeve"]
                $0.noValueDisplayText = "Choose engineer..."
            }
            <<< PickerInputRow<String>("JobType"){
                $0.title = "Job Type"
                $0.options = ["Install", "Service", "Commission", "Breakdown", "Maintenance", "Landlord Check"]
                $0.noValueDisplayText = "Choose job type..."
            }
            
            +++ Section("Customer info:")
            <<< TextRow("CustomerName"){
                $0.title = "Full name"
                $0.placeholder = "Customer name"
//                if $0.wasChanged {
//                    updateSaveButtonState()
//                }
            }
            <<< TextAreaRow("CustomerAddress") {
                $0.placeholder = "Customer address"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 66)
//                if $0.wasChanged {
//                    updateSaveButtonState()
//                }
            }
            <<< TextRow("CustomerPhone") {
                $0.title = "Phone"
                $0.placeholder = "+44 077 7595 3555"
            }
            <<< TextRow("CustomerMobile") {
                $0.title = "Mobile"
                $0.placeholder = "+44 014 4082 0267"
            }
            <<< EmailRow("CustomerEmail") {
                $0.title = "Customer email"
                $0.placeholder = "customer@email.com"
//                if $0.wasChanged {
//                    updateSaveButtonState()
//                }
            }
            
            +++ Section("Equipment info:")
            <<< PickerInputRow<String>("ApplianceMake"){
                $0.title = "Appliance make"
                $0.options = ["Grant", "Worcester", "Firebird", "HRM", "Warmflow", "Potterton", "Thermecon/GAH", "Merlin"]
                $0.noValueDisplayText = "Choose manufacturer..."
            }
            <<< TextRow("ApplianceModel") {
                $0.title = "Appliance model"
                $0.placeholder = "Model name or number"
            }
            <<< TextRow("BurnerMake") {
                $0.title = "Burner make"
                $0.placeholder = "Burner manufacturer"
            }
            <<< TextRow("NozzleModel") {
                $0.title = "Nozzle"
                $0.placeholder = "0.69/13/IA"
            }
            <<< SegmentedRow<String>("PumpPressureMetric"){
                $0.title = "Pump pressure"
                $0.options = ["Psi", "Bar"]
            }
            <<< SliderRow("PumpPressurePsi") {
                $0.hidden = "$PumpPressureMetric != 'Psi'"
                $0.title = "Psi"
                $0.minimumValue = 80
                $0.maximumValue = 250
                $0.steps = 170
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0) psi" }
                    } else {
                        return "Move slider to select value (psi)"
                    }
                }
            }
            <<< SliderRow("PumpPressureBar") {
                $0.hidden = "$PumpPressureMetric != 'Bar'"
                $0.title = "Bar"
                $0.minimumValue = 5
                $0.maximumValue = 20
                $0.steps = 150
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0) bar" }
                    } else {
                        return "Move slider to select value (bar)"
                    }
                }
            }
            <<< SliderRow("CarbonDioxidePercentage") {
                $0.title = "Carbon dioxide"
                $0.minimumValue = 5
                $0.maximumValue = 15
                $0.steps = 100
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0)%" }
                    } else {
                        return "Move slider to select value (%)"
                    }
                }
            }
            <<< SliderRow("FlueGasTemperature") {
                $0.title = "Flue gas temperature"
                $0.minimumValue = 20
                $0.maximumValue = 500
                $0.steps = 96
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0)°C" }
                    } else {
                        return "Move slider to select value (°C)"
                    }
                }
            }
            <<< SliderRow("EfficiencyPercentage") {
                $0.title = "Efficiency"
                $0.minimumValue = 75
                $0.maximumValue = 100
                $0.steps = 250
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0)%" }
                    } else {
                        return "Move slider to select value (%)"
                    }
                }
            }
            <<< SliderRow("CarbonDioxideParts") {
                $0.title = "Carbon dioxide parts"
                $0.minimumValue = 0
                $0.maximumValue = 200
                $0.steps = 200
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0) PPM" }
                    } else {
                        return "Move slider to select value (PPM)"
                    }
                }
            }
            <<< SliderRow("OxygenPercentage") {
                $0.title = "Oxygen"
                $0.minimumValue = 0
                $0.maximumValue = 10
                $0.steps = 100
                $0.displayValueFor = { (rowValue: Float?) in
                    if rowValue != nil {
                        return rowValue.map { "\($0)%" }
                    } else {
                        return "Move slider to select value (%)"
                    }
                }
            }
            
            +++ Section("Description:")
            <<< TextAreaRow("JobDescription") {
                $0.placeholder = "Description of work carried out..."
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 66)
            }
            <<< TextAreaRow("JobUsedParts") {
                $0.placeholder = "Parts used..."
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 44)
            }
            <<< TextAreaRow("JobNotes") {
                $0.placeholder = "Notes for office..."
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 44)
            }
            
            +++ Section("Time:")
            <<< TimeRow("TimeArrived"){
                $0.title = "Arrive"
                $0.value = Date.init()
            }
            <<< TimeRow("TimeLeft"){
                $0.title = "Leave"
                $0.value = Date.init()
            }
            <<< PickerInputRow<String>("TimeTravel"){
                $0.title = "Travel"
                $0.options = []
                for i in 1...11{
                    $0.options.append("\(i*5) minutes")
                }
                $0.options.append("1 hour")
                for i in 1...11{
                    $0.options.append("1 hour \(i*5) minutes")
                }
                $0.options.append("2 hours")
                $0.noValueDisplayText = "Choose time..."
            }
            
            +++ Section("Signature:")
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "... customer signature will be here soon ..."
        }
    }
    
}

class HeaderViewNib: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class HeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let imageView = UIImageView(image: UIImage(named: "Header"))
        imageView.frame = CGRect(x: 0, y: 20, width: 320, height: 130)
        imageView.autoresizingMask = .flexibleWidth
        self.frame = CGRect(x: 0, y: 0, width: 320, height: 130)
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

