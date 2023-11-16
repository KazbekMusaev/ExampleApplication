//
//  EditViewController.swift
//  MyApplication
//
//  Created by apple on 15.11.2023.
//

import UIKit

final class EditViewController: UIViewController {
    
    let viewManager = ViewManager()

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
        
        
        
        NSLayoutConstraint.activate([
            titleFIO.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleFIO.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            editName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            editName.topAnchor.constraint(equalTo: titleFIO.bottomAnchor, constant: 20),
            
            editLastName.topAnchor.constraint(equalTo: titleFIO.bottomAnchor, constant: 20),
            editLastName.leadingAnchor.constraint(equalTo: editName.trailingAnchor, constant: 5),
            editLastName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            aboutMe.topAnchor.constraint(equalTo: editName.bottomAnchor, constant: 20),
            aboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            textFieldAboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textFieldAboutMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textFieldAboutMe.topAnchor.constraint(equalTo: aboutMe.bottomAnchor, constant: 20),
            
            btnExit.bottomAnchor.constraint(equalTo : view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            btnExit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            btnExit.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        
    }
    
    
    lazy var editName = viewManager.getTextField(delegate: self, placeholder: "Введите имя", tag: 1, view: self.view)
    lazy var editLastName = viewManager.getTextField(delegate: self, placeholder: "Введите фамилию", tag: 2, view: self.view)
    lazy var titleFIO = viewManager.getLabel(text: "Инициалы", size: 20, height: 22, backgroundColor: nil)
    lazy var aboutMe = viewManager.getLabel(text: "Напишите о себе", size: 20, height: 22, backgroundColor: nil)
    lazy var textFieldAboutMe = viewManager.getTextField(delegate: self, placeholder: "Напишите о себе что-нибудь интересное", tag: 3, view: nil)    
    lazy var btnExit = viewManager.getBtn(action: exitBtnAction, text: "Заполнить")
    
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
            self.delegate?.setName(name: self.editName.text)
            self.delegate?.setLastName(lastName: self.editLastName.text)
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
