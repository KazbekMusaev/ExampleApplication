//
//  SecondViewController.swift
//  MyApplication
//
//  Created by apple on 27.11.2023.
//

import UIKit

final class SecondViewController: UIViewController {

    var data: TabelData?
    
    private lazy var scroll: UIScrollView = {
        .config($0) {
            $0.addSubview(scrollContent)
            $0.alwaysBounceVertical = true
        }
    }(UIScrollView())
    
    private lazy var scrollContent: UIView = {
        .config($0) {
            $0.addSubview(stack)
        }
    }(UIView())
    
    lazy var image: UIImageView = {
        .config($0) {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
        }
    }(UIImageView())
    
    lazy var userName: UILabel = {
        .config($0) {
            $0.font = .boldSystemFont(ofSize: 20)
        }
    }(UILabel())
    
    lazy var text: UILabel = {
        .config($0) {
            $0.numberOfLines = 0
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16)
        }
    }(UILabel())
    
    
    private lazy var stack: UIStackView = {
        .config($0) {
            $0.addSubview(userName)
            $0.addSubview(image)
            $0.addSubview(text)
        }
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scroll)
        
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imgHeight = (view.frame.width - 30) * ratio
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollContent.topAnchor.constraint(equalTo: scroll.topAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            //scrollContent.heightAnchor.constraint(equalTo: scroll.heightAnchor),
            
            stack.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -10),
            
            userName.topAnchor.constraint(equalTo: stack.topAnchor, constant: 20),
            userName.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 20),
            
            image.heightAnchor.constraint(equalToConstant: imgHeight),
            image.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            image.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            text.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: -10),
            text.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: -10),
            
        ])
    }
    

    

}
