//
//  CollectionViewCell.swift
//  unit1
//
//  Created by Hung Dinh on 3/8/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var name: String = ""
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.image = UIImage.init(named:"Image")
        // Initialization code
    }

}
