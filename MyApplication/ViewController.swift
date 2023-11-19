//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1)
        
        view.addSubview(scroll)
        view.addSubview(btn)
        scrollContent.addSubview(mainHStack)
        scrollContent.addSubview(mainLabel)
        scrollContent.addSubview(textLabel)
        textLabel.addSubview(textLabelCarModel)
        textLabel.addSubview(textAboutCar)
        scrollContent.addSubview(hStack)
        scrollContent.addSubview(secondHStackSmall)
        view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: view.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scrollContent.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
            scrollContent.topAnchor.constraint(equalTo: scroll.topAnchor),
            scrollContent.widthAnchor.constraint(equalTo: scroll.widthAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: scrollContent.topAnchor,constant: 40),
            mainLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            
            mainHStack.leadingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 10),
            mainHStack.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            mainHStack.topAnchor.constraint(equalTo: scrollContent.topAnchor, constant: 20),
            
            secondHStackSmall.topAnchor.constraint(equalTo: mainHStack.bottomAnchor, constant: 15),
            secondHStackSmall.leadingAnchor.constraint(equalTo: mainLabel.trailingAnchor, constant: 10),
            secondHStackSmall.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            
            
            textLabel.topAnchor.constraint(equalTo: secondHStackSmall.bottomAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
        
            textLabelCarModel.topAnchor.constraint(equalTo: textLabel.topAnchor, constant: 10),
            textLabelCarModel.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor, constant: 10),
            
            textAboutCar.topAnchor.constraint(equalTo: textLabelCarModel.bottomAnchor, constant: 5),
            textAboutCar.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor, constant: 5),
            textAboutCar.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: -5),
            textAboutCar.bottomAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: -5),
            
            hStack.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            hStack.leadingAnchor.constraint(equalTo: scrollContent.leadingAnchor, constant: 20),
            hStack.trailingAnchor.constraint(equalTo: scrollContent.trailingAnchor, constant: -20),
            hStack.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: -10),
            
            btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            
        ])
        
        
    }
    
    let firstTwoImage = [
        UIImage(named: "Image")!,
        UIImage(named: "Image 1")!,
    ]
    let secondTwoImage = [
        UIImage(named: "Image 3")!,
        UIImage(named: "Image 4")!
    ]
    
    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.addSubview(scrollContent)
        return scroll
    }()
    
    lazy var scrollContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MotoApp"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        label.textAlignment = .justified
        return label
    }()
    
    lazy var mainHStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        secondTwoImage.forEach {
            let image = self.getImageSmall(image: $0)
            stack.addArrangedSubview(image)
        }
        stack.spacing = 10
        return stack
    }()
    
    lazy var secondHStackSmall: UIStackView = {
        let stack = UIStackView()
         stack.translatesAutoresizingMaskIntoConstraints = false
         stack.axis = .horizontal
         firstTwoImage.forEach {
             let image = self.getImageSmall(image: $0)
             stack.addArrangedSubview(image)
         }
         stack.spacing = 10
         return stack
     }()
    
    lazy var hStackWithPhoto: UIStackView = {
       let stack = UIStackView()
        return stack
    }()
    
    lazy var hStack: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        firstTwoImage.forEach {
            let image = self.getImage(image: $0)
            stack.addArrangedSubview(image)
        }
        stack.spacing = 5
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var textLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        return label
    }()
    
    lazy var textLabelCarModel: UILabel = {
        let label = UILabel()
        label.text = "gt-500"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textAboutCar: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmods"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    lazy var btn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Next", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 169/255, blue: 7/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return btn
    }()
}

extension ViewController {
    func getImage(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageHeigh = (view.frame.width - 25) / 2
        imageView.heightAnchor.constraint(equalToConstant: imageHeigh).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }
    func getImageSmall(image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let imageHeigh = (view.frame.width - 40) / 4
        imageView.heightAnchor.constraint(equalToConstant: imageHeigh).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageHeigh).isActive = true
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }
}
