//
//  GiphyDetailViewController.swift
//  unit1
//
//  Created by Hung Dinh on 3/19/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class GiphyDetailViewController: UIViewController {
    @IBAction func btnComment(_ sender: Any) {
        let commentViewController = CommentViewController(nibName:"CommentViewController",bundle:nil)
        commentViewController.giphy = data
        self.navigationController?.pushViewController(commentViewController, animated: true)
    }
    @IBOutlet weak var imageGiphy: UIImageView!
    @IBOutlet weak var heightImage: NSLayoutConstraint!
    
    @IBOutlet weak var stackCommentView: UIStackView!
    @IBOutlet weak var commentText: UITextField!
    @IBAction func btnSave(_ sender: Any) {
        let imgView:UIImageView = UIImageView(image: data?.image)
        let labelComment: UILabel = UILabel()
        labelComment.text = commentText.text
        labelComment.backgroundColor = UIColor.red
        self.stackCommentView.addArrangedSubview(labelComment)
        UIView.animate(withDuration: 0.25) {
            self.stackCommentView.layoutIfNeeded()
        }
    }
    
    var data: GiphyResponseModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        heightImage.constant = CGFloat((data?.height)!)
        imageGiphy.bounds.size.width = CGFloat((data?.width)!)
        let imgUrl = UIImage.gifImageWithURL((data?.url)!)
        imageGiphy.image = imgUrl
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
