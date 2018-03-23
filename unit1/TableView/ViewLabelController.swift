//
//  ViewLabelController.swift
//  unit1
//
//  Created by Hung Dinh on 3/5/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import UIKit

class ViewLabelController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let strDesc = ["Sáng 14/3, nút giao thông ba tầng đầu tiên ở cửa ngõ Tây Bắc - nhánh N1 của hầm chui An Sương, được thông xe. Ông Trịnh Linh Phương, Phó giám đốc Khu quản lý giao thông đô thị số 3 (chủ đầu tư) nói rằng, việc đưa vào khai thác nhánh N1 sẽ góp phần giảm ùn tắc cũng như tai nạn giao thông tại điểm đen ngã tư An Sương.Ông cũng đề nghị UBND huyện Hóc Môn đẩy nhanh tiến độ giải phóng mặt bằng để nhánh N2 có thể kịp hoàn thành trong năm nay.Sở Giao thông Vận tải TP HCM tổ chức giao thông ở khu vực này như sau:\nTrên nhánh hầm N1 lưu thông một chiều toàn bộ các loại ôtô (trừ xe quá khổ) theo hướng từ đường Trường Chinh đến Quốc lộ 22. Các xe khác bị cấm lưu thông. Tốc độ tối đa cho phép trong hầm là 50km/h; cấm dừng đỗ xe trên suốt chiều dài hầm.\nTrên Quốc lộ 22 (đoạn từ Quốc lộ 1 đến đầu nhánh hầm N1 phía Quốc lộ 22)  hướng từ Quốc lộ 1 đến đường Nguyễn Ảnh Thủ, làn đường sát nhánh hầm N1 dành cho các loại ôtô; làn đường sát vỉa hè Quốc lộ 22 cho cả xe máy, ôtô con lưu thông.","Chậm thanh toán khiến MobiFone có thể bị phạt 8% giá trị hợp đồng với AVG nên việc rút sớm là để không thất thoát vốn Nhà nước","Thất bại trên sân nhà với tỷ số 1-2 ở lượt về khiến Man Utd sớm phải dừng bước tại sân chơi danh giá nhất châu Âu.","Bố mẹ chỉ đầu tư một lần, sau này con phải tự xin việc và làm mọi thứ, Huy nhớ lại câu bố nói khi trao món quà giá trị.","Nhóm tác chiến tàu sân bay USS Carl Vinson bắt đầu diễn tập chung với tàu sân bay trực thăng của Nhật khi di chuyển qua Biển Đông.","Oh! Yeah!","sdsf","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]
    let strTitle = ["Hầm chui cửa ngõ Tây Bắc TP HCM thông xe","MobiFone có thể mất hơn 700 tỷ đồng nếu không rút khỏi AVG" ,"Sevilla loại Man Utd khỏi Champions League","Sinh viên năm nhất được bố mẹ tặng bộ PC 120 triệu đồng","USS Carl Vinson diễn tập cùng chiến hạm Nhật trên Biển Đông","Ahihi"]
    let picture = ["file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1","file2","file1"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strTitle.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.backgroundColor = UIColor.darkGray
        var position:Int = indexPath.row
        print(position)
        let descriptionController = DescriptionController(nibName:"DescriptionController",bundle:nil)
        descriptionController.desc = strDesc[position]
        descriptionController.imageName = picture[position]
        descriptionController.strTitle = strTitle[position]
        //        present(descriptionController, animated: true)
        self.navigationController?.pushViewController(descriptionController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.imgView.image = UIImage(named:picture[indexPath.row])
        cell.lbTitle.text = strTitle[indexPath.row]
        cell.lbDesc.text = strDesc[indexPath.row]
        cell.delegate = self
        cell.rowInt = indexPath.row        
        print("hauahaia")
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight=400
        tableView.rowHeight = UITableViewAutomaticDimension
        let nibName = UINib(nibName: "TableViewCell",bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
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
extension ViewLabelController: ButtonClick {
    func getAction(rowInt: Int){
//        print(rowInt)
//        let descriptionController = DescriptionController(nibName:"DescriptionController",bundle:nil)
//        descriptionController.desc = strDesc[rowInt]
//        descriptionController.imageName = picture[rowInt]
//        present(descriptionController, animated: true)
    }
}
protocol ButtonClick: class {
    func getAction(rowInt: Int)
}


