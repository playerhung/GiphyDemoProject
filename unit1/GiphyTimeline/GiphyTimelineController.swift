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
    var offset = 0
    var isLoading = false

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableTimeLineView.dequeueReusableCell(withIdentifier: "GiphyCell") as! GiphyTableViewCell
        if let element = self.data.first(where: {$0.key == data[indexPath.row].key})
        {
            cell.data = element
            cell.imageGiphy.image = element.image
        }
//        }else{
//            getData(cell: cell,index: indexPath.row)
//        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastData = self.data.count - 1
        if !isLoading && indexPath.row == lastData {
            offset=offset+1
            self.loadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let giphydetailController = GiphyDetailViewController(nibName:"GiphyDetailViewController",bundle:nil)
        if let dataToDetail = self.data.first(where: {$0.key == data[indexPath.row].key}){
            print("send \(indexPath.row)")
            giphydetailController.data = dataToDetail
            self.navigationController?.pushViewController(giphydetailController, animated: true)
        }
    }

    
    @IBOutlet weak var tableTimeLineView: UITableView!
    let client = GPHClient(apiKey: "1dMKOZZdiHLLuXyIcPXc1uglGqtrjuqZ")
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableTimeLineView.delegate = self
        tableTimeLineView.dataSource = self
        tableTimeLineView.estimatedRowHeight = 200
        tableTimeLineView.rowHeight = UITableViewAutomaticDimension
        let nibName = UINib(nibName:"GiphyTableViewCell",bundle:nil)
        tableTimeLineView.register(nibName, forCellReuseIdentifier: "GiphyCell")
        tableTimeLineView.addSubview(refreshController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getData(){
        let cell = GiphyTableViewCell()
        let lista = client.search("cute girl", media: GPHMediaType.gif, offset: offset, limit: 7, rating: GPHRatingType.ratedPG13, lang: GPHLanguageType.english, pingbackUserId: "") { (response, error) in
            if let listData = response?.data{
            DispatchQueue.main.async {
            for imageInfo in listData {
                var height = 0.0
                if let h = imageInfo.images?.fixedHeight?.height{
                    height = Double(h)
                }
                
                var width = 0.0
                if let w = imageInfo.images?.fixedHeight?.width{
                    width = Double(w)
                }
                
                do
                {
                    let url = imageInfo.images?.fixedHeight?.gifUrl!
                    
                    var imgUrl = UIImage.gifImageWithURL(url!)
                    print("load successful)")
                    let ratio = CGFloat(height/width)
                    let scaledHeight = ratio * (cell.frame.size.width-20)
                    let element = GiphyResponseModel(height: Int16(scaledHeight), width: Int16(width), key:imageInfo.id, url: url!, image: imgUrl!)
                    self.saveDataIfNonExist(element:element)
                    self.saveDataToDataBase(element: element)
//                    cell.data = element
//                    cell.imageGiphy.image = element.image
                    
                    self.tableTimeLineView.reloadData()
                    self.isLoading = false
                }
              }
                
            }
            }
        }
        }
//        let op = client.gifByID(listGIF[index]) { (response, error) in
//            if let url = response?.data?.images?.fixedHeight?.gifUrl {
//                DispatchQueue.main.async {
//                    var height = 0.0
//                    if let h = response?.data?.images?.fixedHeight?.height{
//                        height = Double(h)
//                    }
//
//                    var width = 0.0
//                    if let w = response?.data?.images?.fixedHeight?.width{
//                        width = Double(w)
//                    }
//
//                    do
//                    {
//                            var imgUrl = UIImage.gifImageWithURL(url)
//                            print("load \(index)")
//                            let ratio = CGFloat(height/width)
//                            let scaledHeight = ratio * (cell.frame.size.width-20)
//                            let element = GiphyResponseModel(height: Int16(scaledHeight), width: Int16(width), key:self.listGIF[index], url: url, image: imgUrl!)
//                        self.data.append(element)
//                        self.saveDataToDataBase(element: element)
//                        cell.data = element
//                        cell.imageGiphy.image = element.image
//
//                    }
//                    catch
//                    {
//                        print("can't load image")
//                    }
//                }
//            }
//        }
//    }
    
    func saveDataToDataBase(element:GiphyResponseModel){
        if let listGetGif:[Gif] = Gif.getGif(key: element.key!){
            if listGetGif.count == 0 {
                Gif.insertGIF(key: element.key!, like: true, url: element.url!, width: element.width!, height: element.height!)
            }
        }
        print("\(Gif.getAllGif().count)")
    }
    
    func saveDataIfNonExist(element:GiphyResponseModel){
        if self.data.first(where: {$0.key == element.key}) == nil
        {
            self.data.append(element)
            print("save \(element.key)")
        }
    }
    
    lazy var refreshController: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func refresh() {
        data = []
        getData()
        refreshController.endRefreshing()
    }
    
    func loadData() {
        isLoading = true
        getData()
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
