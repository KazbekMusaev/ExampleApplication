//
//  HeaderSecond.swift
//  MyApplication
//
//  Created by apple on 04.01.2024.
//

import UIKit

class HeaderSecond: UICollectionReusableView {
    
    static let reuseId = "HeaderSecond"
    
  
    
    private lazy var title: UILabel = {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 16)
        $0.text = "Галерея"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.topAnchor.constraint(equalTo: topAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
