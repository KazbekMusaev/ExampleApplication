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
        
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        userName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10).isActive = true
        aboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        aboutMe.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        
        textMe.topAnchor.constraint(equalTo: aboutMe.bottomAnchor, constant: 10).isActive = true
        textMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        photoText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        photoText.topAnchor.constraint(equalTo: textMe.bottomAnchor, constant: 50).isActive = true
        
        firstPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        firstPhoto.topAnchor.constraint(equalTo: photoText.bottomAnchor, constant: 10).isActive = true
    
        secondPhoto.leadingAnchor.constraint(equalTo: firstPhoto.trailingAnchor, constant: 9).isActive = true
        secondPhoto.topAnchor.constraint(equalTo: photoText.bottomAnchor, constant: 10).isActive = true
        secondPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        textAboutMe.topAnchor.constraint(equalTo: textMe.topAnchor, constant: 10).isActive = true
        textAboutMe.bottomAnchor.constraint(equalTo: textMe.bottomAnchor, constant: -10).isActive = true
        textAboutMe.leadingAnchor.constraint(equalTo: textMe.leadingAnchor, constant: 10).isActive = true
        textAboutMe.trailingAnchor.constraint(equalTo: textMe.trailingAnchor, constant: -10).isActive = true
        
        editTextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        editTextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        editTextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
    }
    lazy var image : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Image")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.clipsToBounds = true
        image.layer.cornerRadius = 40
        return image
    }()
    
    lazy var userName :  UILabel = {
       let label = UILabel()
        label.text = "Имя Фамилия"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return label
    }()
    
    lazy var aboutMe : UILabel = {
       let label = UILabel()
        label.text = "О себе"
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true
        label.textColor = .black
        return label
    }()
    
    lazy var textMe : UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 14
        label.clipsToBounds = true
        return label
    }()
    
    lazy var textAboutMe: UILabel = {
       let label = UILabel()
        label.text = "Здесь будет информация о вас😊"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var photoText : UILabel = {
        let label = UILabel()
        label.text = "Фото"
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return label
    }()
    
    lazy var firstPhoto: UIImageView = {
       let image = UIImageView()
        let rectangleSide = view.frame.width / 2 - 30
        image.image = UIImage(named: "Image1")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: rectangleSide).isActive = true
        image.widthAnchor.constraint(equalToConstant: rectangleSide).isActive = true
        return image
    }()
    
    lazy var secondPhoto: UIImageView = {
       let image = UIImageView()
        let rectangleSide = view.frame.width / 2 - 30
        image.image = UIImage(named: "Image2")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: rectangleSide).isActive = true
        image.widthAnchor.constraint(equalToConstant: rectangleSide).isActive = true
        return image
    }()
    
    lazy var editTextButton : UIButton = {
       let btn = UIButton(primaryAction: textBtnAction)
        btn.setTitle("Редактировать", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.layer.cornerRadius = 20
        btn.backgroundColor = UIColor(red: 19/255, green: 81/255, blue: 202/255, alpha: 1)
        return btn
    }()
    
    
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
