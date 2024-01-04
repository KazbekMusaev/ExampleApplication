//
//  BannerCell.swift
//  MyApplication
//
//  Created by apple on 04.01.2024.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    
    static let reuseId = "BannerCell"
    
    private lazy var image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        return $0
    }(UIImageView())
    
    private lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
        addSubview(title )
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(data : Item) {
        self.image.image = UIImage(named: data.photo)
        self.title.text = data.text
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: 70),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10 )
        ])
    }
}
