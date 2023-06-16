//
//  ViewController.swift
//  MealWork_TEST
//
//  Created by Solomon  on 12.06.2023.
//

import UIKit
import SnapKit

class ViewController: BaseController {
    
    var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1866114736, green: 0.4170508981, blue: 0.9876943231, alpha: 1)
        button.setTitle("Старт", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func setupViews() {
        view.backgroundColor = .white
        view.addSubview(startButton)
    }

    override func constaintViews() {
        startButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
    }
    
    @objc func startButtonTapped() {
        let mealVC = MealViewController()
        self.navigationController?.pushViewController(mealVC, animated: false)
    }
}




