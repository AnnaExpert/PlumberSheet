//
//  http://iashchuk.com
//  JobTableViewCell.swift
//  PlumberSheet - Work sheet app for in-house plumber engineers
//
//   App developed by KyivApp Development Studio.
//  File created by Alexander Iashchuk on 28/11/17.
//  Copyright © 2017 Alexander Iashchuk (iAlexander). All rights reserved.
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
