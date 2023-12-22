//
//  PhotoCell.swift
//  MyApplication
//
//  Created by apple on 20.12.2023.
//

import UIKit

final class PhotoCell: UICollectionViewCell {
    
    var delegate: ViewControllerDelegate?
    
    private var photoName: String = ""
    
    static let reuseID = "PhotoCell"
    func config(data: PhotoViewerData, view: UIView) {
        lazy var ourView: UIView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = .clear
            $0.addSubview(photo)
            return $0
        }(UIView())
        
        lazy var photo: UIImageView = {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapForPhoto(sender: )))
            tap.numberOfTapsRequired = 2
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isUserInteractionEnabled = true
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.contentMode = .scaleAspectFill
            $0.addGestureRecognizer(tap)
            return $0
        }(UIImageView(image: UIImage(named: data.photo)))
        
        self.addSubview(ourView)
        self.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            ourView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ourView.trailingAnchor.constraint(equalTo: trailingAnchor),
            ourView.topAnchor.constraint(equalTo: topAnchor),
            ourView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            photo.leadingAnchor.constraint(equalTo: ourView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: ourView.trailingAnchor),
            photo.topAnchor.constraint(equalTo: ourView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: ourView.bottomAnchor)
           
        ])
        photoName = data.photo
    }
    @objc func tapForPhoto(sender: UITapGestureRecognizer) {
        self.delegate?.presentFullImageController(photo: photoName)
     }
    
}
