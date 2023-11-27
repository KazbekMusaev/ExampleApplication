//
//  TableViewCell.swift
//  MyApplication
//
//  Created by apple on 27.11.2023.
//

import UIKit

final class PostCell: UITableViewCell {

    
    
    static let getId = "cell"
    //наш вью
    private lazy var ourView: UIView = {
        .config($0) {
            $0.addSubview(stack)
        }
    }(UIView())
    // стек
    private lazy var stack: UIStackView = {
        .config($0) {
            $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
            $0.addSubview(image)
            $0.addSubview(userName)
            $0.addSubview(callBtn)
            $0.addSubview(userInfoBtn)
            $0.addSubview(textAboutUser)
            $0.addSubview(btnInfo)
        }
    }(UIStackView())
    //фотка
    private lazy var image: UIImageView = {
        .config($0) {
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 15
        }
    }(UIImageView())
    //имя пользователя
    private lazy var userName: UILabel = {
        .config($0) {
            $0.font = .boldSystemFont(ofSize: 16)
            $0.textColor = .black
        }
    }(UILabel())
    //кнопка звонка
    private lazy var callBtn: UIButton = {
        .config($0) {
            $0.setImage(UIImage(named: "phone"), for: .normal)
            $0.heightAnchor.constraint(equalToConstant: 21).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 21).isActive = true
        }
    }(UIButton(primaryAction: callBtnAction))
    private lazy var callBtnAction = UIAction { _ in
        print("Вы позвонили пользователю")
    }
    //кнопка пользователя
    private lazy var userInfoBtn: UIButton = {
        .config($0) {
            $0.setImage(UIImage(named: "user"), for: .normal)
            $0.heightAnchor.constraint(equalToConstant: 21).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 21).isActive = true
        }
    }(UIButton(primaryAction: userInfoBtnAction))
    private lazy var userInfoBtnAction = UIAction { _ in
        print("Вы получили информацию о пользователе")
    }
    //текст с информацией
    private lazy var textAboutUser: UILabel = {
        .config($0) {
            $0.numberOfLines = 10
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 14)
        }
    }(UILabel())
    //кнопка "подробнее" переходит на страницу далее
    private lazy var btnInfo: UIButton = {
        .config($0) {
            let text : String = "Подробнее"//нужно добавить аттрибуты
            $0.setTitle(text, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = UIColor(red: 0, green: 255/156, blue: 255/90, alpha: 1)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
    }(UIButton(primaryAction: btnInfoAction))
    private lazy var btnInfoAction = UIAction { _ in
        let vc = SecondViewController()
        self.ourView.inputViewController?.present(vc, animated: true)
    }
    
    func getAction(_ data: TabelData, _ btnAction: UIAction) {
        self.btnInfoAction = btnAction
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
    }
    
    func config(_ data: TabelData) {
        self.addSubview(ourView)
        self.backgroundColor = .clear
        
        self.image.image = UIImage(named: data.photo)
        self.userName.text = data.name
        self.textAboutUser.text = data.text
        
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imgHeight = (self.frame.width - 20) * ratio
        
        NSLayoutConstraint.activate([
            ourView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            ourView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ourView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ourView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            stack.topAnchor.constraint(equalTo: ourView.topAnchor),
            stack.leadingAnchor.constraint(equalTo: ourView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: ourView.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: ourView.bottomAnchor),

            
            
            image.topAnchor.constraint(equalTo: stack.topAnchor),
            image.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: imgHeight),
            
            userName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            userName.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 20),
            
            userInfoBtn.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -10),
            userInfoBtn.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            
            callBtn.trailingAnchor.constraint(equalTo: userInfoBtn.leadingAnchor, constant: -10),
            callBtn.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),

            
            textAboutUser.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 20),
            textAboutUser.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            textAboutUser.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            btnInfo.heightAnchor.constraint(equalToConstant: 50),
            btnInfo.topAnchor.constraint(equalTo: textAboutUser.bottomAnchor, constant: 10),
            btnInfo.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10),
            btnInfo.trailingAnchor.constraint(equalTo: stack.trailingAnchor,constant: -10),
            btnInfo.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -10),
            
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
