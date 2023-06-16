//
//  MealViewController.swift
//  MealWork_TEST
//
//  Created by Solomon  on 12.06.2023.
//

import Foundation
import UIKit
import SnapKit

class MealViewController: BaseController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate  {
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.layer.cornerRadius = 15
        table.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identefier)
        return table
    }()
    
    let modelMeal = ModelMeal()
    
    let backgrounView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        return view
    }()
    
    let toDoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ДОДАТИ ЇЖУ"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.9765065312, green: 0.2900038362, blue: 0.2217293382, alpha: 1)
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Сніданок"
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    let workoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1866114736, green: 0.4170508981, blue: 0.9876943231, alpha: 1)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    let searchProducts: UISearchTextField = {
        let search = UISearchTextField()
        search.placeholder = "Пошук"
        search.backgroundColor = #colorLiteral(red: 0.9590075612, green: 0.9689560533, blue: 0.9816882014, alpha: 1)
        search.font = UIFont.systemFont(ofSize: 15)
        return search
    }()
    
    var segmentetMenuItem = UISegmentedControl()
    
    func setupSegmentedItems(item: [String]){
        segmentetMenuItem = UISegmentedControl(items: item)

        segmentetMenuItem.backgroundColor = #colorLiteral(red: 0.9590075612, green: 0.9689560533, blue: 0.9816882014, alpha: 1)
        segmentetMenuItem.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentetMenuItem.selectedSegmentTintColor = #colorLiteral(red: 0.9765065312, green: 0.2900038362, blue: 0.2217293382, alpha: 1)
        segmentetMenuItem.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentetMenuItem.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        segmentetMenuItem.addTarget(self, action: #selector(segmentedAction), for: .valueChanged)
    }
    
    override func setupViews() {
        
        workoutButton.addTarget(self, action: #selector(workoutButtonTapped), for: .touchUpInside)
        tableView.dataSource = self
        tableView.delegate = self
        searchProducts.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.9590075612, green: 0.9689560533, blue: 0.9816882014, alpha: 1)
        setupSegmentedItems(item: modelMeal.menuItems)
        
        view.backgroundColor = #colorLiteral(red: 0.9590075612, green: 0.9689560533, blue: 0.9816882014, alpha: 1)
        view.addSubview(backgrounView)
        backgrounView.addSubview(toDoTitleLabel)
        backgrounView.addSubview(mainTitleLabel)
        backgrounView.addSubview(workoutButton)
        backgrounView.addSubview(searchProducts)
        backgrounView.addSubview(segmentetMenuItem)
        backgrounView.backgroundColor = .white
        view.addSubview(tableView)
        addNavBarButton(at: .left, with: "multiply")
        addNavBarButton(at: .right, with: "ellipsis")
    }
    override func configureAppearance() {
                segmentetMenuItem.selectedSegmentIndex = 0
        segmentedAction(sender: segmentetMenuItem)

    }
    
    @objc func workoutButtonTapped(){
        let workOutVC = WorkOutViewController()
        self.navigationController?.pushViewController(workOutVC, animated: false)
    }
    
    override func navBarLeftButtontHandler() {
        navigationController?.popViewController(animated: true)
        
    }
    
    override func constaintViews() {
        backgrounView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaInsets)
            make.width.equalTo(view)
            make.height.equalTo(330)
        }
        
        toDoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(backgrounView.snp.top).inset(100)
            make.left.equalTo(12)
        }
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(toDoTitleLabel).inset(20)
            make.left.equalTo(10)
        }
        workoutButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.trailing.equalTo(-18)
        }
        searchProducts.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel).inset(70)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(45)
        }
        segmentetMenuItem.snp.makeConstraints { make in
            make.top.equalTo(searchProducts).inset(70)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(35)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backgrounView.snp.bottom).inset(-20)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(400)
        }
    }
    
    var seartapped: Bool = false
    var obraneTapped: Bool = false
    var moiStravu: Bool = false
    
    @objc func segmentedAction(sender: UISegmentedControl){
        
        switch sender.selectedSegmentIndex {
            
        case 0:
            seartapped = true
            moiStravu = false
            obraneTapped = false
            tableView.reloadData()
            print("Hello1")
        case 1:
            seartapped = false
            moiStravu = false
            obraneTapped = true
            tableView.reloadData()
            print("Hello2")
            
        case 2:
            seartapped = false
            obraneTapped = false
            moiStravu = true
            tableView.reloadData()
            print("Hello3")
            
        default:
            print("Error")
        }
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForProduct = ["Останні продукти", "Інші опції"]
        
        let customHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
            customHeader.backgroundColor = #colorLiteral(red: 0.9590075612, green: 0.9689560533, blue: 0.9816882014, alpha: 1)
        
        NSLayoutConstraint.activate([
            customHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = titleForProduct[section]
            label.font = .boldSystemFont(ofSize: 18)
            return label
        }()
        customHeader.addSubview(headerLabel)
        if moiStravu {
            headerLabel.text = "Мої страви"
        }
        
        headerLabel.snp.makeConstraints { make in
            make.leading.equalTo(customHeader).inset(10)
            make.centerY.equalTo(customHeader)
            make.width.equalTo(300)
        }
        
        return customHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if obraneTapped || moiStravu {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if obraneTapped || moiStravu {
            return 4
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identefier, for: indexPath) as! ProductTableViewCell        
        if seartapped {
            
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.iconeImageView.image = UIImage(named: "fork&spoon")
                cell.nameTitleLabel.text = "Вівсянка"
                cell.infoTitleLbel.text = "250г, 360 ккал"
                cell.dateLableActive()
                cell.arrowButton.setImage(nil, for: .normal)
                cell.whenFindeLabel.text = "Вчора"
                cell.colorImageView.backgroundColor = #colorLiteral(red: 0.9638202786, green: 0.9687923789, blue: 0.9816132188, alpha: 1)
                cell.iconeImageView.tintColor = #colorLiteral(red: 0.6033161283, green: 0.6282605529, blue: 0.6962991357, alpha: 1)
            } else {
                cell.iconeImageView.image = UIImage(named: "fork&spoon")
                cell.nameTitleLabel.text = "Банан"
                cell.infoTitleLbel.text = "250г, 360 ккал"
                cell.dateLableActive()
                cell.arrowButton.setImage(nil, for: .normal)
                cell.whenFindeLabel.text = "Вчора"
                cell.colorImageView.backgroundColor = #colorLiteral(red: 0.9638202786, green: 0.9687923789, blue: 0.9816132188, alpha: 1)
                cell.iconeImageView.tintColor = #colorLiteral(red: 0.6033161283, green: 0.6282605529, blue: 0.6962991357, alpha: 1)
            }
        }
            if indexPath.section == 1 {
            if indexPath.row == 0 {
                
                cell.iconeImageView.image = UIImage(named: "flame")
                cell.nameTitleLabel.text = "Швидке додавання"
                cell.infoTitleLbel.text = nil
                cell.whenFindeLabel.text = nil
                cell.arrowButtonActive()
                cell.arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                cell.colorImageView.backgroundColor = #colorLiteral(red: 0.9638202786, green: 0.9687923789, blue: 0.9816132188, alpha: 1)
                cell.iconeImageView.tintColor = #colorLiteral(red: 0.6033161283, green: 0.6282605529, blue: 0.6962991357, alpha: 1)
            } else {
//                cell.confirureViewCell(imageName: "scan", title: "Сканувати", info: nil, inOrBu: .button)
                cell.iconeImageView.image = UIImage(named: "scan")
                cell.nameTitleLabel.text = "Сканувати"
                cell.infoTitleLbel.text = nil
                cell.whenFindeLabel.text = nil
                cell.arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                cell.arrowButtonActive()
                cell.colorImageView.backgroundColor = #colorLiteral(red: 0.9638202786, green: 0.9687923789, blue: 0.9816132188, alpha: 1)
                cell.iconeImageView.tintColor = #colorLiteral(red: 0.6033161283, green: 0.6282605529, blue: 0.6962991357, alpha: 1)
            }

        }
    }
        if obraneTapped {
//            cell.confirureViewCell(imageName: "fork&spoon", title: "Вівсянка", info: "250г, 360 ккал", inOrBu: .info)
            cell.iconeImageView.image = UIImage(named: "fork&spoon")
            cell.nameTitleLabel.text = "Вівсянка"
            cell.infoTitleLbel.text = "250г, 360 ккал"
            cell.dateLableActive()
            cell.arrowButton.setImage(nil, for: .normal)
            cell.whenFindeLabel.text = "Вчора"
            cell.colorImageView.backgroundColor = #colorLiteral(red: 0.9638202786, green: 0.9687923789, blue: 0.9816132188, alpha: 1)
            cell.iconeImageView.tintColor = #colorLiteral(red: 0.6033161283, green: 0.6282605529, blue: 0.6962991357, alpha: 1)
            
        }
        if moiStravu {
//            cell.confirureViewCell(imageName: "fork&spoon", title: "Сніданок - 240 ккал", info: "Вівсянка, Банан, Молоко", inOrBu: .info)
            cell.iconeImageView.image = UIImage(named: "tea")
            cell.nameTitleLabel.text = "Сніданок - 240 ккал"
            cell.infoTitleLbel.text = "Вівсянка, Банан, Молоко"
            cell.dateLableActive()
            cell.arrowButton.setImage(nil, for: .normal)
            cell.whenFindeLabel.text = "Вчора"
            cell.colorImageView.backgroundColor = #colorLiteral(red: 0.1866114736, green: 0.4170508981, blue: 0.9876943231, alpha: 1)
            cell.iconeImageView.tintColor = .white
            
        }

        if indexPath.row == 0 {
            cell.applyCorners(to: [.topLeft, .topRight], with: cell.bounds)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            view.applyCorners(to: [.topLeft, .topRight], with: view.bounds)
        }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let isLastCell = tableView.numberOfRows(inSection: indexPath.section)-1 == indexPath.row
                if isLastCell {
                    cell.applyCorners(to: [.bottomLeft, .bottomRight], with: cell.bounds)
                }else{
                    cell.noCorners()
                }
    }
    
    var arrayOfProduct = [String]()
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            arrayOfProduct = []
            tableView.reloadData()
//            loadResults(query: text)
        }
    }

    
}

extension UIView {
    func noCorners() {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 0, height: 0))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
    
    func applyCorners(to: UIRectCorner, with rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: to, cornerRadii: CGSize(width: 15, height: 15))
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
}

