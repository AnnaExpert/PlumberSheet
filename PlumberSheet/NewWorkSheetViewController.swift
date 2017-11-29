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
        
        let name = "Alexander Iashchuk"
        let photo = UIImage(named: "Header")
        let rating = 5
        
        // Set the work sheet to be passed to JobTableViewController after the unwind segue.
        workSheet = WorkSheet(name: name, photo: photo, rating: rating)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section() {
            $0.header = HeaderFooterView<HeaderView>(.class)
            }
            
            +++ Section("General info:")
            <<< DateRow(){
                $0.tag = "jobDate"
                $0.title = "Job Date"
                $0.value = Date.init()
            }
            <<< PickerInputRow<String>(){
                $0.tag = "engineerName"
                $0.title = "Engineer"
                $0.options = ["Mark Whittaker", "Scott Chadwick", "Ben Reeve"]
                $0.value = $0.options.first
            }
            <<< PickerInputRow<String>(){
                $0.tag = "jobType"
                $0.title = "Job Type"
                $0.options = ["Install", "Service", "Commission", "Breakdown", "Maintenance", "Landlord Check"]
                $0.value = $0.options.first
            }
            
            +++ Section("Customer info:")
            <<< NameRow(){
//                $0.tag = "
                $0.title = "Full name"
                $0.placeholder = "Customer name"
            }
            <<< TextAreaRow() {
//                $0.tag = "
                $0.placeholder = "Customer address"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 66)
            }
            <<< PhoneRow() {
//                $0.tag = "
                $0.title = "Phone"
                $0.placeholder = "+44 989 8983 5100"
            }
            <<< PhoneRow() {
//                $0.tag = "
                $0.title = "Mobile"
                $0.placeholder = "+44 989 8983 5100"
            }
            <<< EmailRow() {
//                $0.tag = "
                $0.title = "Customer email"
                $0.placeholder = "customer@email.com"
            }
            
            +++ Section("Equipment info:")
            <<< PickerInputRow<String>(){
//                $0.tag = "
                $0.title = "Appliance make"
                $0.options = ["Grant", "Worcester", "Firebird", "HRM", "Warmflow", "Potterton", "Thermecon/GAH", "Merlin", "Other"]
                $0.value = $0.options.first
            }
            <<< TextRow() {
//                $0.tag = "
                $0.title = "Appliance model"
                $0.placeholder = "Model..."
            }
            <<< TextRow() {
//                $0.tag = "
                $0.title = "Burner make"
                $0.placeholder = "Burner..."
            }
            <<< TextRow() {
//                $0.tag = "
                $0.title = "Noozle"
                $0.placeholder = "0.65/80/EN"
            }
            <<< SegmentedRow<String>("segments"){
//                $0.tag = "
                $0.title = "Pump pressure"
                $0.options = ["Psi", "Bar"]
                $0.value = "Psi"
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.hidden = "$segments != 'Psi'"
                $0.title = "Psi"
                $0.value = 150
                $0.minimumValue = 80
                $0.maximumValue = 250
                $0.steps = 170
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0) psi" }
                }
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.hidden = "$segments != 'Bar'"
                $0.title = "Bar"
                $0.value = 10
                $0.minimumValue = 5
                $0.maximumValue = 20
                $0.steps = 150
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0) bar" }
                }
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.title = "Carbon dioxide"
                $0.value = 10
                $0.minimumValue = 5
                $0.maximumValue = 15
                $0.steps = 100
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)%" }
                }
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.title = "Flue gas temperature"
                $0.value = 200
                $0.minimumValue = 20
                $0.maximumValue = 500
                $0.steps = 96
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)°C" }
                }
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.title = "Efficiency"
                $0.value = 90
                $0.minimumValue = 75
                $0.maximumValue = 100
                $0.steps = 250
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)%" }
                }
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.title = "Carbon dioxide parts"
                $0.value = 100
                $0.minimumValue = 0
                $0.maximumValue = 200
                $0.steps = 200
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0) PPM" }
                }
            }
            <<< SliderRow() {
//                $0.tag = "
                $0.title = "Oxygen"
                $0.value = 5
                $0.minimumValue = 0
                $0.maximumValue = 10
                $0.steps = 100
                $0.displayValueFor = { (rowValue: Float?) in
                    return rowValue.map { "\($0)%" }
                }
            }
            
            +++ Section("Description:")
            <<< TextAreaRow() {
//                $0.tag = "
                $0.placeholder = "Description of work carried out:"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 66)
            }
            <<< TextAreaRow() {
//                $0.tag = "
                $0.placeholder = "Parts used:"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 44)
            }
            <<< TextAreaRow() {
//                $0.tag = "
                $0.placeholder = "Notes for office:"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 44)
            }
            
            +++ Section("Time:")
            <<< TimeRow(){
//                $0.tag = "
                $0.title = "Arrive"
                $0.value = Date.init()
            }
            <<< TimeRow(){
//                $0.tag = "
                $0.title = "Leave"
                $0.value = Date.init()
            }
            <<< PickerInputRow<String>(){
//                $0.tag = "
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
                $0.value = $0.options[11]
            }
            
            +++ Section("Signature:")
            <<< ButtonRow("Customer signature") { (row: ButtonRow) -> Void in
                row.title = "Complete form submssion and pass for signature"
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

