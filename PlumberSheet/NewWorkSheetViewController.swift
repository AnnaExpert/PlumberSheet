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

//// !!!IMPORTANT - CHECK xSaveButtonLogic.PNG!!!
//// Disable the Save button while editing.
//saveButton.isEnabled = false

class NewWorkSheetViewController: FormViewController {
    
    /*
     This value is either passed by `JobTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new work sheet.
     */
    var workSheet: WorkSheet?
    
    //MARK: Save Work Sheet Button
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
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
        
//        let row: TextRow? = form.rowBy(tag: "CustomerName")
//        let value = row?.value
//        print(value!)
        let valuesDictionary = form.values()
        print(valuesDictionary)
//        let photo = UIImage(named: "Header")
//        let rating = 5
        
        // Set the work sheet to be passed to JobTableViewController after the unwind segue.
//        workSheet = WorkSheet(
//        jobDate: <#T##Date#>,
//        timeArrived: <#T##Date#>,
//        timeLeft: <#T##Date#>,
//        timeTravel: <#T##String#>,
//        customerName: <#T##String#>,
//        customerAddress: <#T##String#>,
//        customerBilling: <#T##Bool#>,
//        customerBillingAddress: <#T##String?#>,
//        customerPhone: <#T##String?#>,
//        customerMobile: <#T##String?#>,
//        customerEmail: <#T##String#>,
//        engineerName: <#T##String#>,
//        jobType: <#T##String#>,
//        applianceModel: <#T##String#>,
//        applianceMake: <#T##String#>,
//        burnerMake: <#T##String#>,
//        nozzleModel: <#T##String#>,
//        pumpPressure: <#T##Float#>,
//        carbonDioxidePercentage: <#T##Float#>,
//        flueGasTemperature: <#T##Float#>,
//        efficiencyPercentage: <#T##Float#>,
//        carbonDioxideParts: <#T##Float#>,
//        oxygenPercentage: <#T##Float#>,
//        jobDescription: <#T##String#>,
//        jobUsedParts: <#T##String#>,
//        jobNotes: <#T##String#>,
//        engineerSignature: <#T##UIImage#>,
//        customerSignature: <#T##UIImage#>)
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
                $0.value = "Choose engineer..."
            }
            <<< PickerInputRow<String>("JobType"){
                $0.title = "Job Type"
                $0.options = ["Install", "Service", "Commission", "Breakdown", "Maintenance", "Landlord Check"]
                $0.value = "Choose job type..."
            }
            
            +++ Section("Customer info:")
            <<< TextRow("CustomerName"){
                $0.title = "Full name"
                $0.placeholder = "Customer name"
            }
            <<< TextAreaRow("CustomerAddress") {
                $0.placeholder = "Customer address"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 66)
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
            }
            
            +++ Section("Equipment info:")
            <<< PickerInputRow<String>("ApplianceMake"){
                $0.title = "Appliance make"
                $0.options = ["Grant", "Worcester", "Firebird", "HRM", "Warmflow", "Potterton", "Thermecon/GAH", "Merlin"]
                $0.value = "Choose manufacturer..."
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
            <<< SliderRow() {
                $0.tag = "PumpPressurePsi"
                $0.hidden = "$PumpPressureMetric != 'Psi'"
                $0.title = "Psi"
                $0.value = 0
                $0.minimumValue = 80
                $0.maximumValue = 250
                $0.steps = 170
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0) psi" }
                }
            }
            <<< SliderRow() {
                $0.tag = "PumpPressureBar"
                $0.hidden = "$PumpPressureMetric != 'Bar'"
                $0.title = "Bar"
                $0.value = 0
                $0.minimumValue = 5
                $0.maximumValue = 20
                $0.steps = 150
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0) bar" }
                }
            }
            <<< SliderRow("CarbonDioxidePercentage") {
                $0.title = "Carbon dioxide"
                $0.value = 0
                $0.minimumValue = 5
                $0.maximumValue = 15
                $0.steps = 100
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)%" }
                }
            }
            <<< SliderRow("FlueGasTemperature") {
                $0.title = "Flue gas temperature"
                $0.value = 0
                $0.minimumValue = 20
                $0.maximumValue = 500
                $0.steps = 96
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)°C" }
                }
            }
            <<< SliderRow("EfficiencyPercentage") {
                $0.title = "Efficiency"
                $0.value = 0
                $0.minimumValue = 75
                $0.maximumValue = 100
                $0.steps = 250
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)%" }
                }
            }
            <<< SliderRow("CarbonDioxideParts") {
                $0.title = "Carbon dioxide parts"
                $0.value = 0
                $0.minimumValue = 0
                $0.maximumValue = 200
                $0.steps = 200
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0) PPM" }
                }
            }
            <<< SliderRow("OxygenPercentage") {
                $0.title = "Oxygen"
                $0.value = 0
                $0.minimumValue = 0
                $0.maximumValue = 10
                $0.steps = 100
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)%" }
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
//                $0.value = "Choose time..."
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

