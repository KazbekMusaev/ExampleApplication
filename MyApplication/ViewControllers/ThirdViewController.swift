//
//  ThirdViewController.swift
//  MyApplication
//
//  Created by apple on 19.12.2023.
//

import UIKit

final class ThirdViewController: UIViewController {

    let data = TableData.getData()

    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Здесь должна быть таблица, но я не смог ее сюда поставить"
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textColor = .black
        return $0
    }(UILabel())
    
    private lazy var contentView: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: (view.frame.width / 2), height: view.frame.height)
        $0.backgroundColor = .white
        $0.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: $0.topAnchor, constant: 100)
        ])
        return $0
    }(UIView())
    private lazy var highView: UIView = {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeView(sender: )))
        $0.frame = view.frame
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Потяни вправо ->"
        label.frame = CGRect(x: 200, y: 100, width: 150, height: 30)
        label.textColor = .black
        $0.addSubview(label)
        $0.backgroundColor = .lightGray
        $0.addGestureRecognizer(swipe)
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = number
        view.addSubview(contentView)
        view.addSubview(highView)
    }
    
    @objc
    func swipeView(sender: UISwipeGestureRecognizer) {
        if self.highView.frame.origin.x == 0 {
            sender.direction = .left
            UIView.animate(withDuration: 0.5) {
                self.highView.frame.origin.x = self.view.center.x
            }
        } else {
            sender.direction = .right
            UIView.animate(withDuration: 0.5) {
                self.highView.frame.origin.x = 0
            }
        }
        
        
    }


}


