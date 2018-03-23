//
//  DescriptionController.swift
//  unit1
//
//  Created by Hung Dinh on 3/14/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class DescriptionController: UIViewController {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var imageDescription: UIImageView!
    @IBOutlet weak var scrollView2: UIScrollView!
    var imageName: String = ""
    var desc: String = ""
    var strTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbDescription.text = desc
        imageDescription.image = UIImage.init(imageLiteralResourceName: imageName)
        lbTitle.text = strTitle
        // Do any additional setup after loading the view.
        scrollView2.backgroundColor = UIColor.blue
//        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView() {
        imageDescription.leftAnchor.constraint(equalTo: scrollView2.leftAnchor, constant: 60).isActive = true
        imageDescription.topAnchor.constraint(equalTo: scrollView2.topAnchor, constant: 160).isActive = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
