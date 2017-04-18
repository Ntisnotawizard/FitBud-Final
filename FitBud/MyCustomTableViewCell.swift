//
//  MyCustomTableViewCell.swift
//  FitBud
//
//  Created by TheGrandWizard on 17/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {
  
    
    
    @IBOutlet weak var profileItemLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
