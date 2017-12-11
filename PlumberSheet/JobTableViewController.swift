//
//  http://kyivapp.com
//  http://iashchuk.com
//  JobTableViewController.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//  Application version 0.7.2, build 1
//  Last modification on 2017.12.11
//
//   App precisely handcrafted in KyivApp Development Studio
//  File created by Alexander Iashchuk on 3/11/17
//  Copyright © 2017 iashchuk.com
//  Alexander Iashchuk (iAlexander)
//  All rights reserved
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
    // MARK: Email sender code
    
    private lazy var smtpSession: MCOSMTPSession = self.configureSession()
    
    func configureSession() -> MCOSMTPSession {
        let session = MCOSMTPSession()
        session.hostname = "mail.adm.tools"
        session.username = "robot@iashchuk.com"
        session.password = "1p76L9mHOYnp"
        session.port = 25
        session.authType = .SASLCRAMMD5
        session.connectionType = .startTLS
        return session
    }
    
    func sendText(text: String, recipient: String, email: String) {
        
        let messageBuilder = MCOMessageBuilder()
        messageBuilder.header.from = MCOAddress(displayName: "iRoboPlumber", mailbox: "robot@iashchuk.com")
        messageBuilder.header.subject = "Suffolk Oil Solutions - Work Sheet"

        messageBuilder.header.to =  [MCOAddress(displayName: recipient, mailbox: email)]
        
        //MARK: HTML EMAIL SAMPLE SOURCE
        
        let htmlFile = Bundle.main.path(forResource: "email", ofType: "html")
        let htmlString = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        messageBuilder.htmlBody = htmlString
        let sendOperation = self.smtpSession.sendOperation(with: messageBuilder.data())
        
        sendOperation?.start { (error) in
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load any saved jobs
        if let savedJobs = loadJobs() {
            jobs += savedJobs
        }
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
        if job.emaiSenderProcess {
            cell.emailStatusLabel.text = "⚠️"
        }
        if job.emailSenderSuccess {
            cell.emailStatusLabel.text = "✅"
        } else {
            cell.emailStatusLabel.text = "❌"
        }
        
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
            
            // MARK: Swipe to resend email
            let object = self.jobs[indexPath.row]
            let emailText = "Job date: " + object.jobDate + "\n" + "Job type: " + object.jobType + "\n" + "Engineer: " + object.engineerName + "\n" + "Address: " + object.customerAddress
            self.sendText(text: emailText, recipient: object.customerName, email: object.customerEmail)
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
            tableView.setEditing(false, animated: true)
        }
        resend.backgroundColor = UIColor.green
        return [delete, resend]
    }
    
    // MARK: - Navigation
    
    // MARK: - Segues: Prepare the data before the segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! WorkSheetViewController
            if let pathIndex = tableView.indexPathForSelectedRow?.row {
                destination.job = jobs[pathIndex]
            }
        }
    }
    
}
