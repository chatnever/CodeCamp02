//
//  Running.swift
//  CodeCamp02
//
//  Created by Dũng Bé O on 11/16/14.
//  Copyright (c) 2014 Dũng Bé O. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {


    @IBOutlet var likeNumber: UILabel!
    @IBOutlet weak var portraitImage: UIImageView!
    @IBOutlet weak var albumImage: UIScrollView!
    @IBOutlet weak var modelName: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
