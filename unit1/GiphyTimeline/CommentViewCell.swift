//
//  CommentViewCell.swift
//  unit1
//
//  Created by Hung Dinh on 3/22/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class CommentViewCell: UITableViewCell {
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var lblComment: UILabel!
//    var comment:String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
//        lblComment.text = comment
        // Initialization code
        imageAvatar.image = UIImage(named:"jeon-somi-xpn")
        imageAvatar.clipsToBounds = true
        imageAvatar.layer.cornerRadius = imageAvatar.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
