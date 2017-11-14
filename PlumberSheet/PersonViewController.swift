/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A 'Table View Controller' subclass that displays the data for an existing Person or for creating a new Person in the app. This class is also responsible for creating a new person to update in the PeopleTableViewController when the done button is tapped.
     
    Customizations: Whenever you want to add new data about a Person, you will want to add in  appropriate interface elements in the Main.storyboard and have those interface elements updated in this class to display and edit the data. To learn more you  can check out the the README file included in the app.
*/

import UIKit

class PersonViewController: UITableViewController, UITextFieldDelegate {
    // MARK: Properties
    
    /**
        When editing an existing person, this value is passed by 
        PeopleTableViewController in 'prepareForSegue(segue: sender:)'.
    */
    var person: Person?
    
    @IBOutlet weak var doneButton: UIBarButtonItem!

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var imageButton: UIButton!
        
    @IBOutlet weak var addressCustomerTextField: UITextField!
    
    @IBOutlet weak var telephoneCustomerTextField: UITextField!
    
    @IBOutlet weak var mobileCustomerTextField: UITextField!
    
    @IBOutlet weak var emailCustomerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    /**
        When the user hits the return or "Done" button on a text field, we want 
        the keyboard to go away.
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
