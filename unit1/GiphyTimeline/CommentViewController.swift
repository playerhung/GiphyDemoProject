//
//  CommentViewController.swift
//  unit1
//
//  Created by Hung Dinh on 3/22/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var commentTableView: UITableView!
    
    @IBOutlet weak var imageAvatarView: UIImageView!
    
    @IBOutlet weak var edtComment: UITextField!
    
    var giphy: GiphyResponseModel?

    @IBAction func actionSaveComment(_ sender: Any) {
        Comment.insertComment(key: (giphy?.key)!, content: edtComment.text! )
        data = Comment.getComment(key: (giphy?.key!)!)
        commentTableView.beginUpdates()
        commentTableView.insertRows(at: [IndexPath(row:data.count-1,section:0)], with: .automatic)
        commentTableView.endUpdates()
        commentTableView.scrollToRow(at: IndexPath(row:data.count-1,section:0), at: .bottom, animated: true)    }
    
    
    var data:[Comment] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: "CommentViewCell") as! CommentViewCell
        cell.lblComment.text = data[indexPath.row].content
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = Comment.getComment(key: (giphy?.key)!)
        setAvatarImage()
        setTableView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAvatarImage()  {
      imageAvatarView.clipsToBounds = true
        imageAvatarView.layer.cornerRadius = imageAvatarView.frame.height/2
        imageAvatarView.contentMode = .scaleAspectFill
        imageAvatarView.image = UIImage(named:"jeon-somi-xpn")
    }

    func setTableView() {
        commentTableView.delegate = self
        commentTableView.dataSource = self
        let nameCell = UINib(nibName:"CommentViewCell",bundle:nil)
        commentTableView.register(nameCell, forCellReuseIdentifier: "CommentViewCell")
        commentTableView.estimatedRowHeight=400
        commentTableView.rowHeight = UITableViewAutomaticDimension
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
