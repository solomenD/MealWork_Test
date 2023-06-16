//
//  ApproachTableViewCell.swift
//  MealWork_TEST
//
//  Created by Solomon  on 15.06.2023.
//

import UIKit
import SnapKit

class ApproachTableViewCell: UITableViewCell {
    
    static let identefier = "WorkoutViewCell"
    
    var exesiseViewCell: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var numberOfReps: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var infoOfExs: UILabel = {
        let label = UILabel()
        label.text = "25.5кг x 12"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    var weightTextField: UITextField = {
        let field = UITextField()
        field.text = "30"
        field.textColor = .gray
        field.layer.cornerRadius = 10
        field.font = UIFont.systemFont(ofSize: 12)
        field.backgroundColor = Resourses.liteGray
        field.textAlignment = .center
        return field
    }()
    var countOfRepsTextField: UITextField = {
        let field = UITextField()
        field.text = "15"
        field.layer.cornerRadius = 7
        field.font = UIFont.systemFont(ofSize: 12)
        field.backgroundColor = Resourses.liteGray
        field.textAlignment = .center
        return field
    }()
    
    var acseptButton: UIButton = {
        let buttun = UIButton()
        buttun.setImage(UIImage(systemName: "checkmark"), for: .normal)
        buttun.tintColor = .black
        buttun.backgroundColor = Resourses.liteGray
        buttun.layer.cornerRadius = 7
        return buttun
    }()
    @objc func acseptButtonTapped() {
        exesiseViewCell.backgroundColor = Resourses.liteGray
        acseptButton.backgroundColor = .green
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        acseptButton.addTarget(self, action: #selector(acseptButtonTapped), for: .touchUpInside)
        contentView.addSubview(exesiseViewCell)
        exesiseViewCell.addSubview(numberOfReps)
        exesiseViewCell.addSubview(infoOfExs)
        exesiseViewCell.addSubview(weightTextField)
        exesiseViewCell.addSubview(countOfRepsTextField)
        exesiseViewCell.addSubview(acseptButton)
        
        exesiseViewCell.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
        }
        numberOfReps.snp.makeConstraints { make in
            make.top.equalTo(exesiseViewCell).inset(7)
            make.leading.equalTo(15)
        }
        infoOfExs.snp.makeConstraints { make in
            make.top.equalTo(7)
            make.leading.equalTo(70)
        }
        weightTextField.snp.makeConstraints { make in
            make.trailing.equalTo(exesiseViewCell).inset(90)
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.top.equalTo(7)
        }
        countOfRepsTextField.snp.makeConstraints { make in
            make.trailing.equalTo(exesiseViewCell).inset(50)
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.top.equalTo(7)
        }
        
        acseptButton.snp.makeConstraints { make in
            make.trailing.equalTo(exesiseViewCell).inset(10)
            make.width.equalTo(30)
            make.height.equalTo(20)
            make.top.equalTo(7)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
