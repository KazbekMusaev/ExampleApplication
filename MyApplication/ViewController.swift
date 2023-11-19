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
        view.addSubview(scroll)
        
        scrollContent.addSubview(userName)
        scrollContent.addSubview(image)
        scrollContent.addSubview(aboutMe)
        scrollContent.addSubview(textMe)
        scrollContent.addSubview(photoText)
        scrollContent.addSubview(hStack)
        hStack.addSubview(firstPhoto)
        hStack.addSubview(secondPhoto)
        
        view.addSubview(editTextButton)
        textMe.addSubview(textAboutMe)
        textMe.clipsToBounds = true
        textMe.layer.cornerRadius = 14
        scroll.addSubview(refresh)
        
        
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollContent.topAnchor.constraint(equalTo: scroll.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            
            
            scrollContent.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            image.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
            image.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 30),
            userName.centerXAnchor.constraint(equalTo: scrollContent.centerXAnchor),
            userName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            aboutMe.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 30),
            aboutMe.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 200),
            
            textMe.topAnchor.constraint(equalTo: aboutMe.bottomAnchor, constant: 10),
            textMe.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            textMe.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            
            photoText.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 30),
            photoText.topAnchor.constraint(equalTo: textMe.bottomAnchor, constant: 50),

            hStack.topAnchor.constraint(equalTo: photoText.bottomAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            hStack.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -10),
            
            
            firstPhoto.leadingAnchor.constraint(equalTo: hStack.leadingAnchor),
            firstPhoto.topAnchor.constraint(equalTo: hStack.topAnchor),
            firstPhoto.bottomAnchor.constraint(equalTo: hStack.bottomAnchor),
            
            secondPhoto.topAnchor.constraint(equalTo: hStack.topAnchor),
            secondPhoto.trailingAnchor.constraint(equalTo: hStack.trailingAnchor),
            secondPhoto.bottomAnchor.constraint(equalTo: hStack.bottomAnchor),
            
            
            textAboutMe.topAnchor.constraint(equalTo: textMe.topAnchor, constant: 10),
            textAboutMe.bottomAnchor.constraint(equalTo: textMe.bottomAnchor, constant: -10),
            textAboutMe.leadingAnchor.constraint(equalTo: textMe.leadingAnchor, constant: 10),
            textAboutMe.trailingAnchor.constraint(equalTo: textMe.trailingAnchor, constant: -10),
            
            editTextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            editTextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            editTextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    lazy var hStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.backgroundColor = .white
        return stack
    }()
    
    lazy var refresh : UIRefreshControl = {
        let refresh = UIRefreshControl(frame: .zero, primaryAction: refreshAction)
        refresh.tintColor = .green
        return refresh
    }()
    
    lazy var refreshAction = UIAction { _ in
        self.userName.text = "Имя Фамилия"
        self.textAboutMe.text = "Здесь будет информация о вас😊"
        self.refresh.endRefreshing()
    }
    
    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.backgroundColor = .white
        scroll.addSubview(scrollContent)
        return scroll
    }()
    
    
    lazy var scrollContent: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
    }()
    
    lazy var image = managerView.getImage(imageName: "Image", view: self.view, useRectangleSide: false)
    lazy var userName = managerView.getLabel(text: "Имя Фамилия", size: 20, height: 24, backgroundColor: nil)
    lazy var aboutMe = managerView.getLabel(text: "О себе", size: 14, height: 15, backgroundColor: nil)
    lazy var textMe = managerView.getLabel(text: nil, size: nil, height: nil, backgroundColor: UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1))
    lazy var textAboutMe = managerView.getLabel(text: "Здесь будет информация о вас😊", size: 12, height: nil, backgroundColor: nil)
    lazy var photoText = managerView.getLabel(text: "Фото", size: 14, height: 15, backgroundColor: nil)
    lazy var firstPhoto = managerView.getImage(imageName: "Image1", view: self.view, useRectangleSide: true)
    lazy var secondPhoto = managerView.getImage(imageName: "Image2", view: self.view, useRectangleSide: true)
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
