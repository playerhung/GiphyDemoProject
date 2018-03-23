//
//  ViewController.swift
//  unit1
//
//  Created by Hung Dinh on 3/5/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func openCollection(_ sender: Any) {
        self.navigationController?.pushViewController(CollectionViewController(nibName:"CollectionViewController",bundle:nil), animated: true)
    }
    @IBAction func openAutolayout(_ sender: Any) {
        self.navigationController!.pushViewController(AutolayoutController(nibName:"AutolayoutController",bundle:nil), animated: true)
    }
    @IBAction func setAction(_ sender: Any) {
        self.navigationController?.pushViewController(GiphyTimelineController(nibName: "GiphyTimelineController",bundle:nil), animated: true)
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func clickToOpenTableView(_ sender: Any) {
            self.navigationController!.pushViewController(ViewLabelController(nibName:"ViewLabelController",bundle:nil), animated: true)
        
    }
    @IBAction func actionTap(_ sender: UITapGestureRecognizer) {
        print("Tap successful!")
    }
    @IBAction func openTabbar(_ sender: Any) {
   self.navigationController?.pushViewController(TabBarController(nibName:"TabBarController",bundle:nil),animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let url:URL = URL(string: "https://seeklogo.com/images/A/apple-logo-52C416BDDD-seeklogo.com.png")!
//        do
//        {
//            let data:Data = try Data(contentsOf: url)
//            imageView.image = UIImage(data: data)
////            imageView.sizeToFit()
////            imageView.center = self.view.center
////            imageView.contentMode = .scaleAspectFill
//        }
//        catch
//        {
//            print("can't load image")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
