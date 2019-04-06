//
//  HomeCell.swift
//  PomodoroApp
//
//  Created by Ацамаз on 08/01/2019.
//  Copyright © 2019 a.s.bitsoev. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {

    
    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labTimeSpent: UILabel!
    @IBOutlet weak var labNumberOfPomodors: UILabel!
    @IBOutlet weak var imMiniCircle: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
