//
//  PostCell.swift
//  MyApplication
//
//  Created by apple on 03.12.2023.
//

import UIKit

class PostCell: UITableViewCell {

    private lazy var ourView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(image)
        return $0
    }(UIView())
    
    static let getId = "PostCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        return $0
    }(UIImageView())
    
    func config(_ data: TableDataSecond) {
        self.addSubview(ourView)
        self.backgroundColor = .clear
        
        self.image.image = UIImage(named: data.photo)
        
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imgHeight = (self.frame.width - 20) * ratio
        
        
        NSLayoutConstraint.activate([
            ourView.topAnchor.constraint(equalTo: self.topAnchor),
            ourView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            ourView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ourView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: ourView.topAnchor),
            image.leadingAnchor.constraint(equalTo: ourView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: ourView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: ourView.bottomAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: imgHeight)
            
            
            
        ])
        
    }
    
}
