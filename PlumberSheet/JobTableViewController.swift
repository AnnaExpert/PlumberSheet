//
//  http://iashchuk.com
//  JobTableViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//  Created by Alexander Iashchuk on 3/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
//

import UIKit

class JobTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var jobs = [WorkSheet]()
    
    //MARK: Private Methods
    
    private func loadSampleJobs() {
        
        let photo1 = UIImage(named: "Header")
        let photo2 = UIImage(named: "Header")
        let photo3 = UIImage(named: "Header")
        
        guard let job1 = WorkSheet(name: "Lord Duncan of Springbank", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let job2 = WorkSheet(name: "Baroness Evans of Bowes Park", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let job3 = WorkSheet(name: "Sir Patrick McLoughlin", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }
        
        jobs += [job1, job2, job3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleJobs()

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
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // Fetches the appropriate job for the data source layout.
        let job = jobs[indexPath.row]

        // Configure the cell...
        cell.nameLabel.text = job.name
        cell.dateLabel.text = "Webnesday"
        cell.addressLabel.text = "6th Floor East, Portland House, Bressenden Place, London, SW1E 5BH, Portland House, Bressenden Place, London, SW1E 5BH"
        cell.emailStatusImageView.image = job.photo

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
