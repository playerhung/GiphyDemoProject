//
//  unit1
//
//  Created by Hung Dinh on 3/9/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit
import GiphyCoreSDK

class GiphyTimelineController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var data : [GiphyResponseModel] = []
    let listGIF = ["tp3gmSQQpxEXe","wFMRxRPQlloSA","aIByFBfdrLAn6","qRSjC2vzplXfG","PUT0OeM1S8U4E","SOs17hZeAivjW","aPOSkITTpRWSY"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listGIF.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableTimeLineView.dequeueReusableCell(withIdentifier: "GiphyCell") as! GiphyTableViewCell
        if let element = self.data.first(where: {$0.key == self.listGIF[indexPath.row]})
        {
            cell.imageGiphy.image = element.image
        }else{
            getGIF(cell: cell,index: indexPath.row)
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let giphydetailController = GiphyDetailViewController(nibName:"GiphyDetailViewController",bundle:nil)
        if let dataToDetail = self.data.first(where: {$0.key == self.listGIF[indexPath.row]}){
            print("send \(indexPath.row)")
            giphydetailController.data = dataToDetail
            self.navigationController?.pushViewController(giphydetailController, animated: true)
        }
    }
    
    @IBOutlet weak var tableTimeLineView: UITableView!
    let client = GPHClient(apiKey: "1dMKOZZdiHLLuXyIcPXc1uglGqtrjuqZ")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTimeLineView.delegate = self
        tableTimeLineView.dataSource = self
        tableTimeLineView.estimatedRowHeight = 200
        tableTimeLineView.rowHeight = UITableViewAutomaticDimension
        let nibName = UINib(nibName:"GiphyTableViewCell",bundle:nil)
        tableTimeLineView.register(nibName, forCellReuseIdentifier: "GiphyCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getGIF(cell: GiphyTableViewCell,index:Int) {
        let op = client.gifByID(listGIF[index]) { (response, error) in
            if let url = response?.data?.images?.fixedHeight?.gifUrl {
                DispatchQueue.main.async {
                    var height = 0.0
                    if let h = response?.data?.images?.fixedHeight?.height{
                        height = Double(h)
                    }
                    
                    var width = 0.0
                    if let w = response?.data?.images?.fixedHeight?.width{
                        width = Double(w)
                    }
                   
                    do
                    {
                        if let element = self.data.first(where: {$0.key == self.listGIF[index]})
                        {
                            cell.imageGiphy.image = element.image
                        }else{
                            var imgUrl = UIImage.gifImageWithURL(url)
                            print("load \(index)")
                            cell.imageGiphy.clipsToBounds = true
                            cell.imageGiphy.contentMode = UIViewContentMode.scaleAspectFill
                            let ratio = CGFloat(height/width)
                            let scaledHeight = ratio * (cell.frame.size.width-20)
                            var element = GiphyResponseModel(height: Int16(scaledHeight), width: Int16(width), key: self.listGIF[index], url: url, image: imgUrl!)
                            self.data.append(element)
                            self.saveDataToDataBase(element: element)
                            cell.imageGiphy.image = element.image
                            cell.data = element
                        }
                    }
                    catch
                    {
                        print("can't load image")
                    }
                }
            }
        }
    }
    
    func saveDataToDataBase(element:GiphyResponseModel){
        if let listGetGif:[Gif] = Gif.getGif(key: element.key!){
            if listGetGif.count == 0 {
                Gif.insertGIF(key: element.key!, like: true, url: element.url!, width: element.width!, height: element.height!)
            }
        }
        print("\(Gif.getAllGif().count)")
    }
}
extension GiphyTimelineController:ClickComment{
    func acctionCommentClick(model:GiphyResponseModel) {
        if let dataToDetail = self.data.first(where: {$0.key == model.key}){
//            print("send \(indexPath.row)")
        let commentViewController = CommentViewController(nibName:"CommentViewController",bundle:nil)
        commentViewController.giphy = dataToDetail
        self.navigationController?.pushViewController(commentViewController, animated: true)
    }
    }
}
protocol ClickComment : class{
    func acctionCommentClick(model:GiphyResponseModel)
}
