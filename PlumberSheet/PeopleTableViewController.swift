//
//  http://iashchuk.com
//  PeopleTableViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 6/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    // MARK: Properties

    // Setup the initial array of people.
    var people = [Person]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()        
        title = "Suffolk Oil Solutions - Boiler & Tank Specialists"
    }


    /// Load in and some initial sample data and update the table view's display.
    func loadSampleData() {
        /*
            You can modify the names and images here to populate this with your
            own friends and family. In the README file there are instructions for
            how to add in your own images.
        */
        let person1 = Person(name: "Sir Patrick McLoughlin ",
                        image: UIImage(named: "Sample1"),
                addressCustomer: "2nd floor NW, Fry Building, 2 Marsham Street, London, SW1P 4DF")
        let person2 = Person(name: "Philip Hammond",
                        image: UIImage(named: "Sample2"),
                addressCustomer: "1-13 St Giles High St, London, WC2H 8LG")
        let person3 = Person(name: "Boris Johnson",
                        image: UIImage(named: "Sample3"),
                addressCustomer: "21 Bloomsbury Street, London, United Kingdom, WC1B 3HF")

        people = [person1, person2, person3]
        tableView.reloadData()
    }
    
    
    // MARK: Table View
    
    /**
        The table view calls this method to find out how many rows it should
        show in any one section.
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We only have a single section and want one row per person.
        return people.count
    }
    
    
    /// The table view calls this method to set up each cell in the table for display.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          // Ask the table view to create a cell for us to use to show a person.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Get the person we are displaying for this row.
        let person = people[indexPath.row]
        
        // Set the text and image in the cell.
        cell.textLabel!.text = person.name
        cell.imageView!.image = person.image
        
        // Now the cell has been setup, return it to the table view.
        return cell
    }
    
    
    // MARK: Navigation
    
    /**
        This method is called whenever the user segues, or transitions, to a new 
        view controller. In this application, this happens when the user taps the 
        "Add" button or taps a table view cell to view a person's details.
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPersonSegue" {
            print("Adding new person.")
        }
        else if segue.identifier == "ShowPersonSegue" {
            let destinationController = segue.destination as! PersonViewController
            let selectedTableCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: selectedTableCell)
            let person = people[indexPath!.row]
            destinationController.person = person
        }
    }

    /**
        This method is called when this view controller will reappear after the 
        "Done" button was tapped on the PersonViewController.
    */
    @IBAction func unwindToPersonList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PersonViewController, let person = sourceViewController.person {
            /*
                If an index path was selected in the table then it was editing an
                existing person. Otherwise the user had tapped the add button.
            */
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                /*
                    Update an existing person before reloading the table row to
                    ensure the updated person is displayed in the table.
                */
                people[selectedIndexPath.row] = person
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                /*
                    Add a new person to the people array before animating in a 
                    new table row with the person's data.
                 
                 NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
                 NSEntityDescription *entity = [NSEntityDescription entityForName:@"<#Entity name#>" inManagedObjectContext:<#context#>];
                 [fetchRequest setEntity:entity];
                 // Specify criteria for filtering which objects to fetch
                 NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
                 [fetchRequest setPredicate:predicate];
                 // Specify how the fetched objects should be sorted
                 NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
                 ascending:YES];
                 [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
                 
                 NSError *error = nil;
                 NSArray *fetchedObjects = [<#context#> executeFetchRequest:fetchRequest error:&error];
                 if (fetchedObjects == nil) {
                 <#Error handling code#>
                 }
                 
                */
                let newIndexPath = IndexPath(row: people.count, section: 0)
                people.append(person)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
        }
    }
}

