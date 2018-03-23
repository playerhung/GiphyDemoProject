//
//  GiphyTableViewCell.swift
//  unit1
//
//  Created by Hung Dinh on 3/19/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit
import GiphyCoreSDK
class GiphyTableViewCell: UITableViewCell {

    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var imageGiphy: UIImageView!
    @IBOutlet weak var btnShare: UIButton!
     @IBOutlet weak var heightImageConstraint: NSLayoutConstraint!
    var delegate : ClickComment?
    var data:GiphyResponseModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openComment(_ sender: Any) {
        delegate?.acctionCommentClick(model: data!)
    }
    
}
