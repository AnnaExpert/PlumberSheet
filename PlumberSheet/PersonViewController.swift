//
//  http://iashchuk.com
//  PersonViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 7/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//
/*
import UIKit

class PersonViewController: UITableViewController, UITextFieldDelegate {
    // MARK: Properties
    
    /*
        When editing an existing person, this value is passed by 
        PeopleTableViewController in 'prepareForSegue(segue: sender:)'.
    */
    var person: Person?
    
    @IBOutlet weak var doneButton: UIBarButtonItem!

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var imageButton: UIButton!
        
    @IBOutlet weak var addressCustomerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Page title
        title = "Suffolk Oil Solutions - New work sheet"
        
        // Set up the views if editing an existing person.
        if let person = person {
            nameTextField.text = person.name
            imageButton.setImage(person.image, for: [])
            addressCustomerTextField.text = person.addressCustomer
        }
    }
    
    
    // MARK: Navigation
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        /*
            Depending on style of presentation, this view controller needs to be 
            dismissed in two different ways. We used a modal presentation for 
            adding people, which needs to be dismissed. Editing an existing person 
            used a 'push', which requires a 'pop' to return to the previous page.
        */
        let isPresentingInAddMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Only update the person if the done button was tapped.
        if let sender = sender as? UIBarButtonItem!, sender === doneButton {
            let name = nameTextField.text
            let image = imageButton.image(for: [])
            let addressCustomer = addressCustomerTextField.text
            
            /*
                Create and set the person to be passed to PeopleTableViewController 
                after the unwind segue.
            */
            person = Person(name: name, image: image, addressCustomer: addressCustomer)
        }
    }


    // MARK: UITextFieldDelegate
    
    /*
        When the user hits the return or "Done" button on a text field, we want 
        the keyboard to go away.
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
*/
