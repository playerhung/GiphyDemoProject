//
//  TableViewCell.swift
//  unit1
//
//  Created by Hung Dinh on 3/6/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lbDesc: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    var rowInt: Int?
    weak var delegate: ButtonClick?
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        delegate?.getAction(rowInt: rowInt!)
        // Configure the view for the selected state
    }
    
    func tapAction(sender:UITapGestureRecognizer) {
        
    }
}

