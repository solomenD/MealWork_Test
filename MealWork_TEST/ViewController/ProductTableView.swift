////
////  ProductTableView.swift
////  MealWork_TEST
////
////  Created by Solomon  on 14.06.2023.
////
//
//import UIKit
//import SnapKit
//
//class ProductTableView: NSObject ,UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let titleForProduct = ["Останні продукти", "Інші опції"]
//        
//        let customHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
//            customHeader.backgroundColor = #colorLiteral(red: 0.9590075612, green: 0.9689560533, blue: 0.9816882014, alpha: 1)
//
//        
//        let headerLabel: UILabel = {
//            let label = UILabel()
//            label.text = titleForProduct[section]
//            label.font = .boldSystemFont(ofSize: 18)
//            return label
//        }()
//        customHeader.addSubview(headerLabel)
//        
//        headerLabel.snp.makeConstraints { make in
//            make.leading.equalTo(customHeader).inset(10)
//            make.centerY.equalTo(customHeader)
//            make.width.equalTo(300)
//        }
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        50
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        2
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        2
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identefier, for: indexPath) as! ProductTableViewCell
//        cell.confirureViewCell(imageName: "fork&spoon", title: "Вівсянка", info: "250г, 360 ккал", inOrBu: .info)
//        
//        return cell
//    }
//}
//    
//    
//
//
