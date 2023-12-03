//
//  PostCell.swift
//  MyApplication
//
//  Created by apple on 03.12.2023.
//

import UIKit

class PostCell: UICollectionViewCell {
    static let reuseId = "PostCell"
    
    var index: Int = 0
    
    var delegate: ViewControllerDelegate?
    
    func config(_ data: ModelData, view: UIView) {
        
        lazy var btnAction = UIAction { _ in
            self.delegate?.presentWebController(index: self.index, link: data.link)
            print(self.index)
        }
        
        lazy var btn: UIButton = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.setTitle(data.link, for: .normal)
            $0.heightAnchor.constraint(equalToConstant: 20).isActive = true
            return $0
        }(UIButton(primaryAction: btnAction))
        
        lazy var ourView: UIView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
            $0.frame.size.width = view.frame.width - 20
            $0.addSubview(title)
            $0.addSubview(image)
            $0.addSubview(text)
            $0.addSubview(btn)
            return $0
        }(UIView())
        
        lazy var title: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = .boldSystemFont(ofSize: 20)
            $0.text = data.title
            $0.textColor = .black
            return $0
        }(UILabel())
        
        lazy var image: UIImageView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFill
            
            let ratio = ($0.image?.size.height ?? 0) / ($0.image?.size.width ?? 0)
            let imgHeight = (view.frame.size.width - 20) * ratio
            let imgWidth = (view.frame.size.width - 60)
            
            $0.heightAnchor.constraint(equalToConstant: imgHeight).isActive = true
            $0.widthAnchor.constraint(equalToConstant: imgWidth).isActive = true
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 30
            return $0
        }(UIImageView(image: UIImage(named: data.photo)))
        
        lazy var text: UILabel = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.font = .systemFont(ofSize: 16)
            $0.textColor = .black
            $0.text = data.text
            $0.numberOfLines = 0
            return $0
        }(UILabel())
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 20
        
        
        self.addSubview(ourView)
        NSLayoutConstraint.activate([
            ourView.topAnchor.constraint(equalTo: self.topAnchor),
            ourView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ourView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ourView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            
            title.leadingAnchor.constraint(equalTo: ourView.leadingAnchor, constant: 33),
            title.topAnchor.constraint(equalTo: ourView.topAnchor, constant: 21),
            
            image.leadingAnchor.constraint(equalTo: ourView.leadingAnchor, constant: 10),
            image.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: ourView.trailingAnchor, constant: -10),
            
            
            text.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 22),
            text.leadingAnchor.constraint(equalTo: ourView.leadingAnchor, constant: 33),
            text.trailingAnchor.constraint(equalTo: ourView.trailingAnchor, constant: -33),

            
            btn.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 20),
            btn.leadingAnchor.constraint(equalTo: ourView.leadingAnchor, constant: 33),
            btn.trailingAnchor.constraint(equalTo: ourView.trailingAnchor, constant: -33),
            btn.bottomAnchor.constraint(equalTo: ourView.bottomAnchor, constant: -10)
            
        ])
    }
    
}
