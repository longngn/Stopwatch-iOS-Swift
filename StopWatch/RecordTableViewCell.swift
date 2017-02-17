//
//  RecordTableViewCell.swift
//  StopWatch
//
//  Created by Nguyen Le Vu Long on 12/25/16.
//  Copyright © 2016 Nguyen Le Vu Long. All rights reserved.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var recordTime: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        orderNumber.textColor = ViewController.color.orange
        recordTime.textColor = ViewController.color.blue
        backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
