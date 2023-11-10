//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.


import UIKit

final class ViewController: UIViewController {

    lazy var nameBtn: UIButton = {
        let btn = UIButton(primaryAction: nameBtnAction)
        btn.frame = CGRect(x: 20, y: 200, width: 150, height: 40)
        btn.setTitle("Покажи имя", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 10
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
        if let name = self.nameTextField.text {
            self.nameLabel.text = "Мое имя : \(name)"
        }
    }
    
    lazy var lastNameBtn : UIButton = {
        let btn = UIButton(primaryAction: lastNameBtnAction)
        btn.frame = CGRect(x: 180, y: 200, width: 180, height: 40)
        btn.setTitle("Покажи фамилию", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 10
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
        if let lastName = self.lastNameTextField.text {
            self.lastNameLabel.text = "Моя фамилия : \(lastName)"
        }
    }
    
    lazy var groupBtn: UIButton = {
        let btn = UIButton(primaryAction: groupBtnAction)
        btn.frame = CGRect(x: 20, y: 250, width: 340, height: 40)
        btn.setTitle("Показать группу", for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 10
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
        if let groupNumber = self.groupTextField.text {
            self.groupLabel.text = "Группа №\(groupNumber)"
        }
    }
    
    lazy var invisibility : UIButton = {
       let btn = UIButton(primaryAction: invisibilityAction)
        btn.setTitle("Скрыть", for: .normal)
        btn.frame = CGRect(x: 20, y: 300, width: 340, height: 40)
        btn.backgroundColor = .lightGray
        btn.layer.cornerRadius = 10
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var invisibilityAction = UIAction { _ in
        self.nameLabel.text = "Мое имя"
        self.lastNameLabel.text = "Моя фамилия"
        self.groupLabel.text = "Группа"
    }
    
    lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 350, width: 340, height: 40)
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.placeholder = "Введите имя"
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
      let textField = UITextField()
        textField.frame = CGRect(x: 20, y: 395, width: 340, height: 40)
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 10
        textField.placeholder = "Введите фамилию"
        return textField
    }()
    
    lazy var groupTextField: UITextField = {
        let textField = UITextField()
          textField.frame = CGRect(x: 20, y: 440, width: 340, height: 40)
          textField.backgroundColor = .clear
          textField.layer.borderWidth = 2
          textField.layer.cornerRadius = 10
          textField.placeholder = "Введите номер группы"
          return textField
    }()
    
    lazy var exitKeyboard: UIButton = {
        let btn = UIButton(primaryAction: exitKeyboardAction)
        btn.frame = CGRect(x: 20, y: 485, width: 340, height: 40)
        btn.backgroundColor = .lightGray
        btn.setTitle("Скрыть клавиатуру", for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    lazy var exitKeyboardAction = UIAction { _ in
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        view.addSubview(nameBtn)
        view.addSubview(nameLabel)
        
        view.addSubview(lastNameBtn)
        view.addSubview(lastNameLabel)
        
        view.addSubview(groupBtn)
        view.addSubview(groupLabel)
        
        view.addSubview(invisibility)
        
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(groupTextField)
        
        view.addSubview(exitKeyboard)
    }
}
