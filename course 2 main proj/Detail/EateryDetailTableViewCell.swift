//
//  EateryDetailTableViewCell.swift
//  course 2 main proj
//
//  Created by Daria on 08/08/2019.
//  Copyright © 2019 D.Misch. All rights reserved.
//

import UIKit

class EateryDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
