//
//  EditViewController.swift
//  MyApplication
//
//  Created by apple on 15.11.2023.
//

import UIKit

final class EditViewController: UIViewController {

    var delegate : ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(editName)
        view.addSubview(editLastName)
        view.addSubview(titleFIO)
        view.addSubview(aboutMe)
        view.addSubview(textFieldAboutMe)
        view.addSubview(btnExit)
        
        
        titleFIO.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        titleFIO.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        editName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        editName.topAnchor.constraint(equalTo: titleFIO.bottomAnchor, constant: 20).isActive = true
        
        editLastName.topAnchor.constraint(equalTo: titleFIO.bottomAnchor, constant: 20).isActive = true
        editLastName.leadingAnchor.constraint(equalTo: editName.trailingAnchor, constant: 5).isActive = true
        editLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        aboutMe.topAnchor.constraint(equalTo: editName.bottomAnchor, constant: 20).isActive = true
        aboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        textFieldAboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        textFieldAboutMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        textFieldAboutMe.topAnchor.constraint(equalTo: aboutMe.bottomAnchor, constant: 20).isActive = true
        
        btnExit.bottomAnchor.constraint(equalTo : view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        btnExit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        btnExit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
    
    
    lazy var editName: UITextField = {
       let textField = UITextField()
        let oneSize = view.frame.width / 2 - 30
        textField.placeholder = "Введите свое имя"
        textField.delegate = self
        textField.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        textField.textColor = .black
        textField.tag = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: oneSize).isActive = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var editLastName: UITextField = {
       let textField = UITextField()
        let oneSize = view.frame.width / 2 - 30
        textField.delegate = self
        textField.placeholder = "Введите свою фамилию"
        textField.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        textField.textColor = .black
        textField.tag = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.widthAnchor.constraint(equalToConstant: oneSize).isActive = true
        textField.layer.cornerRadius = 10
        return textField
    }()

    lazy var titleFIO : UILabel = {
       let label = UILabel()
        label.text = "Инициалы"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        return label
    }()
    
    lazy var aboutMe: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Напишите о себе"
        label.font = .boldSystemFont(ofSize: 20)
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        return label
    }()
    
    
    lazy var textFieldAboutMe: UITextField = {
       let textField = UITextField()
        textField.delegate = self
        textField.tag = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        textField.placeholder = "Напишите о себе"
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    lazy var btnExit: UIButton = {
        let btn = UIButton(primaryAction: exitBtnAction)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Заполнить", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 19/255, green: 81/255, blue: 202/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return btn
    }()
    
    lazy var exitBtnAction = UIAction { _ in
        self.delegate?.setName(name: self.editName.text)
        self.delegate?.setLastName(lastName: self.editLastName.text)
        self.delegate?.setAboutMeText(aboutMe: self.textFieldAboutMe.text)
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 3 {
            self.delegate?.setAboutMeText(aboutMe: self.textFieldAboutMe.text)
            self.navigationController?.popViewController(animated: true)
        } else if textField.tag == 1 {
            self.delegate?.setName(name: self.editName.text)
            self.view.endEditing(true)
        } else if textField.tag == 2 {
            self.delegate?.setLastName(lastName: self.editLastName.text)
            self.view.endEditing(true)
        }
        return true
    }
}
