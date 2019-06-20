//
//  MealTableViewCell.swift
//  CustomTableViewCell
//
//  Created by NTQ on 6/17/19.
//  Copyright © 2019 NTQ. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var lblNameMeal: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var imgMeal: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
