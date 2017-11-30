//
//  http://iashchuk.com
//  JobTableViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 3/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit
import os.log

class JobTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var jobs = [WorkSheet]()
    
    //MARK: Private Methods
    
    private func saveJobs() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(jobs, toFile: WorkSheet.ArchiveURL.path)
        if isSuccessfulSave {
            if #available(iOS 10.0, *) {
                os_log("Jobs successfully saved.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
        } else {
            if #available(iOS 10.0, *) {
                os_log("Failed to save jobs...", log: OSLog.default, type: .error)
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    private func loadJobs() -> [WorkSheet]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: WorkSheet.ArchiveURL.path) as? [WorkSheet]
    }
    
    //MARK: Actions
    
    @IBAction func unwindToJobList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewWorkSheetViewController, let workSheet = sourceViewController.workSheet {
            
            // Add a new work sheet.
            let newIndexPath = IndexPath(row: jobs.count, section: 0)
            
            jobs.append(workSheet)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            saveJobs()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
        
        // Load any saved jobs
        if let savedJobs = loadJobs() {
            jobs += savedJobs
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jobs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "JobTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? JobTableViewCell  else {
            fatalError("The dequeued cell is not an instance of JobTableViewCell.")
        }
        // Fetches the appropriate job for the data source layout.
        let job = jobs[indexPath.row]

        // Configure the cell...
        cell.nameLabel.text = job.customerName
        cell.dateLabel.text = job.jobDate
        cell.addressLabel.text = job.customerAddress
        cell.emailStatusImageView.image = job.customerSignature

        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // MARK: - Swipe buttons: Swipe to edit buttons configuration
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            // MARK: Swipe to delete cell
            self.jobs.remove(at: indexPath.row)
            self.saveJobs()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let resend = UITableViewRowAction(style: .normal, title: "Resend") { (action, indexPath) in
            
            // MARK: Swipe to show the recognized text from speech
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
            tableView.setEditing(false, animated: true)
        }
        resend.backgroundColor = UIColor.orange
        return [delete, resend]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            if #available(iOS 10.0, *) {
                os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            
        case "ShowItem":
            guard let ShowItemSheetViewController = segue.destination as? WorkSheetViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedJobCell = sender as? JobTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedJobCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedJob = jobs[indexPath.row]
            ShowItemSheetViewController.job = selectedJob
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    /*
     let photo1 = UIImage(named: "Header")
     private func loadSampleJobs() {
     
     let photo1 = UIImage(named: "Header")
     let photo2 = UIImage(named: "Header")
     let photo3 = UIImage(named: "Header")
     
     guard let job1 = WorkSheet(
     jobDate: <#T##Date#>,
     timeArrived: <#T##Date#>,
     timeLeft: <#T##Date#>,
     timeTravel: <#T##String#>,
     customerName: <#T##String#>,
     customerAddress: <#T##String#>,
     customerBilling: <#T##Bool#>,
     customerBillingAddress: <#T##String?#>,
     customerPhone: <#T##String?#>,
     customerMobile: <#T##String?#>,
     customerEmail: <#T##String#>,
     engineerName: <#T##String#>,
     jobType: <#T##String#>,
     applianceModel: <#T##String#>,
     applianceMake: <#T##String#>,
     burnerMake: <#T##String#>,
     nozzleModel: <#T##String#>,
     pumpPressure: <#T##Float#>,
     carbonDioxidePercentage: <#T##Float#>,
     flueGasTemperature: <#T##Float#>,
     efficiencyPercentage: <#T##Float#>,
     carbonDioxideParts: <#T##Float#>,
     oxygenPercentage: <#T##Float#>,
     jobDescription: <#T##String#>,
     jobUsedParts: <#T##String#>,
     jobNotes: <#T##String#>,
     engineerSignature: <#T##UIImage#>,
     customerSignature: <#T##UIImage#>)
     else {
     fatalError("Unable to instantiate job1")
     }
     guard let job2 = WorkSheet(
     jobDate: <#T##Date#>,
     timeArrived: <#T##Date#>,
     timeLeft: <#T##Date#>,
     timeTravel: <#T##String#>,
     customerName: <#T##String#>,
     customerAddress: <#T##String#>,
     customerBilling: <#T##Bool#>,
     customerBillingAddress: <#T##String?#>,
     customerPhone: <#T##String?#>,
     customerMobile: <#T##String?#>,
     customerEmail: <#T##String#>,
     engineerName: <#T##String#>,
     jobType: <#T##String#>,
     applianceModel: <#T##String#>,
     applianceMake: <#T##String#>,
     burnerMake: <#T##String#>,
     nozzleModel: <#T##String#>,
     pumpPressure: <#T##Float#>,
     carbonDioxidePercentage: <#T##Float#>,
     flueGasTemperature: <#T##Float#>,
     efficiencyPercentage: <#T##Float#>,
     carbonDioxideParts: <#T##Float#>,
     oxygenPercentage: <#T##Float#>,
     jobDescription: <#T##String#>,
     jobUsedParts: <#T##String#>,
     jobNotes: <#T##String#>,
     engineerSignature: <#T##UIImage#>,
     customerSignature: <#T##UIImage#>)
     else {
     fatalError("Unable to instantiate job2")
     }
     
     guard let job3 = WorkSheet(
     jobDate: <#T##Date#>,
     timeArrived: <#T##Date#>,
     timeLeft: <#T##Date#>,
     timeTravel: <#T##String#>,
     customerName: <#T##String#>,
     customerAddress: <#T##String#>,
     customerBilling: <#T##Bool#>,
     customerBillingAddress: <#T##String?#>,
     customerPhone: <#T##String?#>,
     customerMobile: <#T##String?#>,
     customerEmail: <#T##String#>,
     engineerName: <#T##String#>,
     jobType: <#T##String#>,
     applianceModel: <#T##String#>,
     applianceMake: <#T##String#>,
     burnerMake: <#T##String#>,
     nozzleModel: <#T##String#>,
     pumpPressure: <#T##Float#>,
     carbonDioxidePercentage: <#T##Float#>,
     flueGasTemperature: <#T##Float#>,
     efficiencyPercentage: <#T##Float#>,
     carbonDioxideParts: <#T##Float#>,
     oxygenPercentage: <#T##Float#>,
     jobDescription: <#T##String#>,
     jobUsedParts: <#T##String#>,
     jobNotes: <#T##String#>,
     engineerSignature: <#T##UIImage#>,
     customerSignature: <#T##UIImage#>)
     else {
     fatalError("Unable to instantiate job3")
     }
     
     jobs += [job1, job2, job3]
     }
     */
    
}