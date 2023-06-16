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
        label.text = Resourses.Text.addEatLabel
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = Resourses.redColor
        return label
    }()
    
    let mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.breakfastLabel
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    let workoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Resourses.bluButonColor
        button.tintColor = .white
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.layer.cornerRadius = 25
        return button
    }()
    
    let searchProducts: UISearchTextField = {
        let search = UISearchTextField()
        search.placeholder = "Пошук"
        search.backgroundColor = Resourses.liteGray
        search.font = UIFont.systemFont(ofSize: 15)
        return search
    }()
    
    var segmentetMenuItem = UISegmentedControl()
    
    func setupSegmentedItems(item: [String]){
        segmentetMenuItem = UISegmentedControl(items: item)

        segmentetMenuItem.backgroundColor = Resourses.liteGray
        segmentetMenuItem.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segmentetMenuItem.selectedSegmentTintColor = Resourses.redColor
        segmentetMenuItem.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentetMenuItem.setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        segmentetMenuItem.addTarget(self, action: #selector(segmentedAction), for: .valueChanged)
    }
    
    override func setupViews() {
        
        workoutButton.addTarget(self, action: #selector(workoutButtonTapped), for: .touchUpInside)
        tableView.dataSource = self
        tableView.delegate = self
        searchProducts.delegate = self
        tableView.backgroundColor = Resourses.liteGray
        setupSegmentedItems(item: modelMeal.menuItems)
        
        view.backgroundColor = Resourses.liteGray
        view.addSubview(backgrounView)
        backgrounView.addSubview(toDoTitleLabel)
        backgrounView.addSubview(mainTitleLabel)
        backgrounView.addSubview(workoutButton)
        backgrounView.addSubview(searchProducts)
        backgrounView.addSubview(segmentetMenuItem)
        backgrounView.backgroundColor = .white
        view.addSubview(tableView)
        addNavBarButton(at: .left, with: Resourses.Images.multiply)
        addNavBarButton(at: .right, with: Resourses.Images.ellipsis)
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
        
        let customHeader = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
            customHeader.backgroundColor = Resourses.liteGray
        
        NSLayoutConstraint.activate([
            customHeader.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = Resourses.titleForProduct[section]
            label.font = .boldSystemFont(ofSize: 18)
            return label
        }()
        customHeader.addSubview(headerLabel)
        if moiStravu {
            headerLabel.text = Resourses.titleForProduct[2]
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
                cell.colorImageView.backgroundColor = Resourses.liteGray
                cell.iconeImageView.tintColor = Resourses.gray
            } else {
                cell.iconeImageView.image = UIImage(named: "fork&spoon")
                cell.nameTitleLabel.text = "Банан"
                cell.infoTitleLbel.text = "250г, 360 ккал"
                cell.dateLableActive()
                cell.arrowButton.setImage(nil, for: .normal)
                cell.whenFindeLabel.text = "Вчора"
                cell.colorImageView.backgroundColor = Resourses.liteGray
                cell.iconeImageView.tintColor = Resourses.gray
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
                cell.colorImageView.backgroundColor = Resourses.liteGray
                cell.iconeImageView.tintColor = Resourses.gray
            } else {
//                cell.confirureViewCell(imageName: "scan", title: "Сканувати", info: nil, inOrBu: .button)
                cell.iconeImageView.image = UIImage(named: "scan")
                cell.nameTitleLabel.text = "Сканувати"
                cell.infoTitleLbel.text = nil
                cell.whenFindeLabel.text = nil
                cell.arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
                cell.arrowButtonActive()
                cell.colorImageView.backgroundColor = Resourses.liteGray
                cell.iconeImageView.tintColor = Resourses.gray
            }

        }
    }
        if obraneTapped {
            cell.iconeImageView.image = UIImage(named: "fork&spoon")
            cell.nameTitleLabel.text = "Вівсянка"
            cell.infoTitleLbel.text = "250г, 360 ккал"
            cell.dateLableActive()
            cell.arrowButton.setImage(nil, for: .normal)
            cell.whenFindeLabel.text = "Вчора"
            cell.colorImageView.backgroundColor = Resourses.liteGray
            cell.iconeImageView.tintColor = Resourses.gray
            
        }
        if moiStravu {
            cell.iconeImageView.image = UIImage(named: "tea")
            cell.nameTitleLabel.text = "Сніданок - 240 ккал"
            cell.infoTitleLbel.text = "Вівсянка, Банан, Молоко"
            cell.dateLableActive()
            cell.arrowButton.setImage(nil, for: .normal)
            cell.whenFindeLabel.text = "Вчора"
            cell.colorImageView.backgroundColor = Resourses.bluButonColor
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
        if searchBar.text != nil {
            arrayOfProduct = []
            tableView.reloadData()
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

