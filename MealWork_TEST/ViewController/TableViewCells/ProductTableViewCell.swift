//
//  ProductTableViewCell.swift
//  MealWork_TEST
//
//  Created by Solomon  on 13.06.2023.
//

import UIKit
import SnapKit

enum InfoOrButton {
    case info
    case button
}

class ProductTableViewCell: UITableViewCell {

    var productView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    var colorImageView: UIView = {
        let view = UIView()
        view.backgroundColor = Resourses.liteGray
        view.layer.cornerRadius = 18
        return view
    }()
    
    var iconeImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = Resourses.gray
        return image
    }()
    var nameTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var infoTitleLbel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .darkGray
        return label
    }()
    
    var arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Resourses.Images.chevronRight), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let whenFindeLabel: UILabel = {
       let label = UILabel()
        label.text = "Вчора"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    static let identefier = "ProductView"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        productView.addSubview(colorImageView)
        colorImageView.addSubview(iconeImageView)
        productView.addSubview(nameTitleLabel)
        productView.addSubview(infoTitleLbel)
        contentView.addSubview(productView)
        
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func arrowButtonActive(){
        productView.addSubview(arrowButton)
        arrowButton.snp.makeConstraints { make in
            make.centerY.equalTo(productView)
            make.trailing.equalTo(-10)
    }
    }
    func dateLableActive(){
        productView.addSubview(whenFindeLabel)
        whenFindeLabel.snp.makeConstraints { make in
            make.centerY.equalTo(productView)
            make.trailing.equalTo(-10)
        }
    }
    
    func configureConstraints(){
        productView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(380)
        }
        colorImageView.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(10)
            make.width.equalTo(36)
            make.height.equalTo(36)
        }
        iconeImageView.snp.makeConstraints { make in
            make.leading.equalTo(7)
            make.top.equalTo(7)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        nameTitleLabel.snp.makeConstraints { make in
            if infoTitleLbel.text == nil {
                make.centerY.equalTo(productView)
            } else {
                make.top.equalTo(10)
            }
            make.leading.equalTo(iconeImageView).inset(50)
        }
        infoTitleLbel.snp.makeConstraints { make in
            make.top.equalTo(nameTitleLabel).inset(20)
            make.leading.equalTo(nameTitleLabel)
        }
        
    }
  
}


