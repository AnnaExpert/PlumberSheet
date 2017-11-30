//
//  http://iashchuk.com
//  WorkSheetViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 29/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit
import Eureka
import os.log

class WorkSheetViewController: FormViewController{
    
    public var job: WorkSheet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up views if editing an existing Work Sheet.
        self.title = job?.customerName
        
        form +++ Section() {
            $0.header = HeaderFooterView<HeaderView>(.class)
            }
            
            +++ Section("General info:")
            <<< LabelRow("JobDate"){
                $0.title = "Job date"
                $0.value = job?.jobDate
            }
            <<< LabelRow("EngineerName"){
                $0.title = "Engineer"
                $0.value = job?.engineerName
            }
            <<< LabelRow("JobType"){
                $0.title = "Job type"
                $0.value = job?.jobType
            }
            
            +++ Section("Customer info:")
            <<< LabelRow("CustomerName"){
                $0.title = "Full name"
                $0.value = job?.customerName
            }
            <<< LabelRow("CustomerAddress") {
                $0.title = "CustomerAddress"
                $0.value = job?.customerAddress
            }
//            <<< LabelRow("CustomerBillingAddress"){
//                $0.hidden = Condition.function(["switchCustomerBillingAddress"], { form in
//                    return !((form.rowBy(tag: "switchCustomerBillingAddress") as? SwitchRow)?.value ?? false)
//                })
//                $0.placeholder = "Billing address"
//                $0.textAreaHeight = .dynamic(initialTextViewHeight: 66)
//            }
//            <<< SwitchRow("switchCustomerBillingAddress"){
//                $0.title = "Add billing address"
//            }
            <<< LabelRow("CustomerEmail") {
                $0.title = "Email"
                $0.value = job?.customerEmail
            }
            <<< LabelRow("CustomerPhone") {
                $0.title = "Phone"
                $0.value = job?.customerPhone
            }
            <<< LabelRow("CustomerMobile") {
                $0.title = "Mobile"
                $0.value = job?.customerMobile
            }
            
            +++ Section("Equipment info:")
            <<< PickerInputRow<String>("ApplianceMake"){
                $0.title = "Appliance make"
                $0.options = ["Grant", "Worcester", "Firebird", "HRM", "Warmflow", "Potterton", "Thermecon/GAH", "Merlin"]
                $0.noValueDisplayText = "Choose manufacturer..."
                } .onCellHighlightChanged {cell, row in
                    row.value = row.options.first
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
                $0.title = "Pump pressure unit"
                $0.options = ["Bar", "Psi"]
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
                $0.hidden = Condition.function(["switchJobUsedParts"], { form in
                    return !((form.rowBy(tag: "switchJobUsedParts") as? SwitchRow)?.value ?? false)
                })
                $0.placeholder = "Parts used..."
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 44)
            }
            <<< TextAreaRow("JobNotes") {
                $0.hidden = Condition.function(["switchJobNotes"], { form in
                    return !((form.rowBy(tag: "switchJobNotes") as? SwitchRow)?.value ?? false)
                })
                $0.placeholder = "Notes for office..."
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 44)
            }
            <<< SwitchRow("switchJobUsedParts"){
                $0.title = "Add used parts"
            }
            <<< SwitchRow("switchJobNotes"){
                $0.title = "Add job notes"
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
                } .onCellHighlightChanged {cell, row in
                    row.value = row.options.first
            }
            
            +++ Section("Signatures:")
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "... customer signature will be here soon ..."
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
