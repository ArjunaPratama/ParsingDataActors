//
//  DATableViewCell.swift
//  ParsingDataActors
//
//  Created by DOTS2 on 11/3/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class DATableViewCell: UITableViewCell {

    @IBOutlet weak var lblheight: UILabel!
    @IBOutlet weak var lblcountry: UILabel!
    @IBOutlet weak var lbldob: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
