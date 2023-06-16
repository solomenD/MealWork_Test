//
//  WorkoutTableViewCell.swift
//  MealWork_TEST
//
//  Created by Solomon  on 15.06.2023.
//

import UIKit
import SnapKit

class WorkoutTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    static let identefier = "WorkoutView"
    
    var exesiseView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var iconeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Resourses.Images.workoutMan)
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.deadlift
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var infoTitleLbel: UILabel = {
        let label = UILabel()
        label.text = Resourses.Text.countOfRepsApproaches
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        return label
    }()
    
    var dotButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Resourses.Images.ellipsis), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(ApproachTableViewCell.self, forCellReuseIdentifier: ApproachTableViewCell.identefier)
        return table
    }()
    
    var qttyOfReps = 4
    
    var isActiveButton = true
    
    @objc func dotButtonTapped() {
//        if isActiveButton == false {
//            isActiveButton = true
//        } else if isActiveButton == true{
//            isActiveButton = false
//        }
//        print("gi")
//        completion()
//        isActiveButton = false
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        dotButton.addTarget(self, action: #selector(dotButtonTapped), for: .touchUpInside)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        tableView.isHidden = true
        contentView.addSubview(exesiseView)
        exesiseView.addSubview(iconeImageView)
        exesiseView.addSubview(nameTitleLabel)
        exesiseView.addSubview(infoTitleLbel)
        exesiseView.addSubview(dotButton)
        exesiseView.addSubview(tableView)
        
        exesiseView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }

        iconeImageView.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        nameTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.leading.equalTo(iconeImageView.snp.trailing).inset(-15)
        }
        infoTitleLbel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel.snp.bottom)
            make.leading.equalTo(nameTitleLabel)
        }
        
        dotButton.snp.makeConstraints { make in
            make.centerY.equalTo(exesiseView)
            make.trailing.equalTo(-10)
    }
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(qttyOfReps*40)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let customHeader: UIView = {
            let view = UIView()
            return view
        }()
        let nuSetupLabel: UILabel = {
            let label = UILabel()
            label.text = "Підхід"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        let infoTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Попередній"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        let weigTitleLabel: UILabel = {
            let label = UILabel()
            label.text = "Вага"
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        let repsLabel: UILabel = {
            let label = UILabel()
            label.text = "Повт."
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 10)
            return label
        }()
        let imageCheckView: UIImageView = {
            let image = UIImageView()
            image.tintColor = .gray
            image.image = UIImage(systemName: "checkmark")
            return image
        }()
        
        
        customHeader.addSubview(nuSetupLabel)
        customHeader.addSubview(infoTitleLabel)
        customHeader.addSubview(weigTitleLabel)
        customHeader.addSubview(repsLabel)
        customHeader.addSubview(imageCheckView)
        
        customHeader.snp.makeConstraints { make in
             make.width.equalTo(370)
            make.height.equalTo(20)
        }
        nuSetupLabel.snp.makeConstraints { make in
            make.leading.equalTo(customHeader).inset(10)
            make.centerY.equalTo(customHeader)
        }
        infoTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(nuSetupLabel).inset(65)
            make.centerY.equalTo(customHeader)
        }
        weigTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(infoTitleLabel).inset(180)
            make.centerY.equalTo(customHeader)
        }
        repsLabel.snp.makeConstraints { make in
            make.leading.equalTo(weigTitleLabel).inset(40)
            make.centerY.equalTo(customHeader)
        }
        imageCheckView.snp.makeConstraints { make in
            make.leading.equalTo(repsLabel).inset(50)
            make.width.equalTo(10)
            make.height.equalTo(10)
            make.centerY.equalTo(customHeader)
        }
        
        return customHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        34
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ApproachTableViewCell.identefier, for: indexPath) as! ApproachTableViewCell
        cell.numberOfReps.text = String(indexPath.row+1)
        
        return cell
    }
    
}
