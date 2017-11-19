//
//  http://iashchuk.com
//  MainViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 20/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import Eureka
/*
class MainFormViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Section1")
            <<< TextRow(){ row in
                row.title = "Text Row"
                row.placeholder = "Enter text here"
            }
            <<< PhoneRow(){
                $0.title = "Phone Row"
                $0.placeholder = "And numbers here"
            }
            +++ Section("Section2")
            <<< DateRow(){
                $0.title = "Date Row"
                $0.value = Date(timeIntervalSinceReferenceDate: 0)
        }
    }
}
*/
//MARK: MainViewController

class MainViewController : FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++
            
            Section("iAlexander Section")
            
            <<< ButtonRow("Rows") {
                $0.title = $0.tag
                $0.presentationMode = .segueName(segueName: "RowsExampleViewControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Native iOS Event Form") { row in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "NativeEventsFormNavigationControllerSegue", onDismiss:{  vc in vc.dismiss(animated: true) })
            }
            
            <<< ButtonRow("Accesory View Navigation") { (row: ButtonRow) in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "AccesoryViewControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Custom Cells") { (row: ButtonRow) -> () in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "CustomCellsControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Customization of rows with text input") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "FieldCustomizationControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Hidden rows") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "HiddenRowsControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Disabled rows") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "DisabledRowsControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Formatters") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "FormattersControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Inline rows") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "InlineRowsControllerSegue", onDismiss: nil)
            }
            <<< ButtonRow("List Sections") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "ListSectionsControllerSegue", onDismiss: nil)
            }
            <<< ButtonRow("Validations") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "ValidationsControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Custom Design") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "CustomDesignControllerSegue", onDismiss: nil)
            }
            
            <<< ButtonRow("Multivalued Sections") { (row: ButtonRow) -> Void in
                row.title = row.tag
                row.presentationMode = .segueName(segueName: "MultivaluedSectionsControllerSegue", onDismiss: nil)
            }
            
            
            +++ Section()
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "About"
                }
                .onCellSelection { [weak self] (cell, row) in
//                    self?.showAlert()
        }
}
}
