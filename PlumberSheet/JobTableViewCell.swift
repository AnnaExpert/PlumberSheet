//
//  http://kyivapp.com
//  http://iashchuk.com
//  JobTableViewCell.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//  Application version 0.8.0, build 1
//  Last modification on 2017.12.11
//
//   App precisely handcrafted in KyivApp Development Studio
//  File created by Alexander Iashchuk on 28/11/17
//  Copyright © 2017 iashchuk.com
//  Alexander Iashchuk (iAlexander)
//  All rights reserved
//


import UIKit

class JobTableViewCell: UITableViewCell {
    
    //MARK: Cell Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailStatusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
