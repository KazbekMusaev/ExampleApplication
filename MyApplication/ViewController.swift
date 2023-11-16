//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

protocol ViewControllerDelegate {
    func setName(name: String?)
    func setLastName(lastName: String?)
    func setAboutMeText(aboutMe: String?)
}

final class ViewController: UIViewController {
    
    let managerView = ViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(userName)
        view.addSubview(image)
        view.addSubview(aboutMe)
        view.addSubview(textMe)
        view.addSubview(photoText)
        view.addSubview(firstPhoto)
        view.addSubview(secondPhoto)
        view.addSubview(editTextButton)
        textMe.addSubview(textAboutMe)
        textMe.clipsToBounds = true
        textMe.layer.cornerRadius = 14
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            aboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            aboutMe.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            
            textMe.topAnchor.constraint(equalTo: aboutMe.bottomAnchor, constant: 10),
            textMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            photoText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            photoText.topAnchor.constraint(equalTo: textMe.bottomAnchor, constant: 50),
            
            firstPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            firstPhoto.topAnchor.constraint(equalTo: photoText.bottomAnchor, constant: 10),
        
            secondPhoto.leadingAnchor.constraint(equalTo: firstPhoto.trailingAnchor, constant: 9),
            secondPhoto.topAnchor.constraint(equalTo: photoText.bottomAnchor, constant: 10),
            secondPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textAboutMe.topAnchor.constraint(equalTo: textMe.topAnchor, constant: 10),
            textAboutMe.bottomAnchor.constraint(equalTo: textMe.bottomAnchor, constant: -10),
            textAboutMe.leadingAnchor.constraint(equalTo: textMe.leadingAnchor, constant: 10),
            textAboutMe.trailingAnchor.constraint(equalTo: textMe.trailingAnchor, constant: -10),
            
            editTextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editTextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editTextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    lazy var image = managerView.getImage(imageName: "Image", view: self.view)
    lazy var userName = managerView.getLabel(text: "Имя Фамилия", size: 20, height: 24, backgroundColor: nil)
    lazy var aboutMe = managerView.getLabel(text: "О себе", size: 14, height: 15, backgroundColor: nil)
    lazy var textMe = managerView.getLabel(text: nil, size: nil, height: nil, backgroundColor: UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1))
    lazy var textAboutMe = managerView.getLabel(text: "Здесь будет информация о вас😊", size: 12, height: nil, backgroundColor: nil)
    lazy var photoText = managerView.getLabel(text: "Фото", size: 14, height: 15, backgroundColor: nil)
    lazy var firstPhoto = managerView.getImage(imageName: "Image1", view: self.view)
    lazy var secondPhoto = managerView.getImage(imageName: "Image2", view: self.view)
    lazy var editTextButton = managerView.getBtn(action: textBtnAction, text: "Редактировать")
    
    
    lazy var textBtnAction = UIAction { _ in
        let editVC = EditViewController()
        editVC.delegate = self
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}



extension ViewController : ViewControllerDelegate {
    func setName(name: String?) {
        guard let name = name else { return }
        self.userName.text = "\(name)"
    }
    
    func setLastName(lastName: String?) {
        guard let lastName = lastName else { return }
        self.userName.text! += " \(lastName)"
    }
    
    func setAboutMeText(aboutMe: String?) {
        self.textAboutMe.text = aboutMe
    }
}
