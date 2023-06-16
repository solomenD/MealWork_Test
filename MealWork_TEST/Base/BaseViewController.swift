//
//  BaseViewController.swift
//  MealWork_TEST
//
//  Created by Solomon  on 12.06.2023.
//

import UIKit

enum NavBarPosition {
    
    case left
    case right
    
}

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        constaintViews()
        configureAppearance()
    }
    
}
@objc extension BaseController {
    func setupViews() {
        
    }
    func constaintViews() {
        
    }
    func configureAppearance() {
        
    }
    
    func navBarLeftButtontHandler() {
        print("NavBar left button tapped")
    }
    
    func navBarRightButtontHandler() {
        print("NavBar right button tapped")
    }
    
}
extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with image: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.tintColor = .black
        button.setImage(UIImage(systemName: image), for: .normal)
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtontHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtontHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
