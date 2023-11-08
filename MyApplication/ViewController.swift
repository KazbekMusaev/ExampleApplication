//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.


import UIKit

class ViewController: UIViewController {

    lazy var nameBtn: UIButton = {
        let btn = UIButton(primaryAction: nameBtnAction)
        btn.frame = CGRect(x: 20, y: 300, width: 150, height: 40)
        btn.setTitle("Покажи имя", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        return btn
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 50, width: 210, height: 50)
        label.text = "Мое имя"
        label.textColor = .black
        return label
    }()
    
    lazy var nameBtnAction = UIAction { _ in
            self.nameLabel.text = "Мое имя : Казбек"
    }
    
    lazy var lastNameBtn : UIButton = {
        let btn = UIButton(primaryAction: lastNameBtnAction)
        btn.frame = CGRect(x: 180, y: 300, width: 180, height: 40)
        btn.setTitle("Покажи фамилию", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        return btn
    }()
    
    lazy var lastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Моя фамилия"
        label.frame = CGRect(x: 20, y: 90, width: 210, height: 50)
        label.textColor = .black
        return label
    }()
    
    lazy var lastNameBtnAction = UIAction { _ in
        self.lastNameLabel.text = "Моя фамилия : Мусаев"
    }
    
    lazy var groupBtn: UIButton = {
        let btn = UIButton(primaryAction: groupBtnAction)
        btn.frame = CGRect(x: 20, y: 350, width: 340, height: 40)
        btn.setTitle("Показать группу", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var groupLabel: UILabel = {
       let label = UILabel()
        label.text = "Группа"
        label.frame = CGRect(x: 20, y: 130, width: 210, height: 50)
        label.textColor = .black
       return label
    }()
    
    lazy var groupBtnAction = UIAction { _ in
        self.groupLabel.text = "Группа №5"
    }
    
    lazy var invisibility : UIButton = {
       let btn = UIButton(primaryAction: invisibilityAction)
        btn.setTitle("Скрыть", for: .normal)
        btn.frame = CGRect(x: 20, y: 400, width: 340, height: 40)
        btn.backgroundColor = .lightGray
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var invisibilityAction = UIAction { _ in
        self.nameLabel.text = "Мое имя"
        self.lastNameLabel.text = "Моя фамилия"
        self.groupLabel.text = "Группа"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(nameBtn)
        view.addSubview(nameLabel)
        
        view.addSubview(lastNameBtn)
        view.addSubview(lastNameLabel)
        
        view.addSubview(groupBtn)
        view.addSubview(groupLabel)
        
        view.addSubview(invisibility)
        
    }
}
