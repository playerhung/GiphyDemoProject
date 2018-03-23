//
//  GiphyResponseModel.swift
//  unit1
//
//  Created by Hung Dinh on 3/20/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import Foundation
import UIKit
struct  GiphyResponseModel{
    var height: Int16?
    var width: Int16?
    var key: String?
    var url: String?
    var image : UIImage?
    init(height:Int16,width:Int16,key:String,url:String,image:UIImage) {
        self.height = height
        self.width = width
        self.url = url
        self.key = key
        self.image = image
    }
}
