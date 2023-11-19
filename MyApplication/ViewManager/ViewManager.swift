//
//  ViewManager.swift
//  MyApplication
//
//  Created by apple on 16.11.2023.
//

import UIKit

class ViewManager {
    func getImage(imageName: String, view: UIView, useRectangleSide: Bool) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        if useRectangleSide {
            let rectangleSide = view.frame.width / 2 - 30
            image.heightAnchor.constraint(equalToConstant: rectangleSide).isActive = true
            image.widthAnchor.constraint(equalToConstant: rectangleSide).isActive = true
        } else  {
            image.heightAnchor.constraint(equalToConstant: 80).isActive = true
            image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        }
        image.image = UIImage(named: imageName)
        return image
    }
    func getTextField(delegate : UITextFieldDelegate, placeholder: String, tag : Int, view : UIView?) -> UITextField {
        let textField = UITextField()
        if let view = view {
            let oneSize = view.frame.width / 2 - 20
            textField.widthAnchor.constraint(equalToConstant: oneSize).isActive = true
        }
         textField.delegate = delegate
         textField.tag = tag
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
         textField.placeholder = placeholder
         textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
         textField.clipsToBounds = true
         textField.layer.cornerRadius = 10
         return textField
    }
    func getLabel(text: String?, size: CGFloat?, height: CGFloat?, backgroundColor : UIColor?) -> UILabel {
        let label = UILabel()
         label.text = text
        if let size = size {
            label.font = .boldSystemFont(ofSize: size)
        }
         label.translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            label.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let backgroundColor = backgroundColor {
            label.backgroundColor = backgroundColor
        }
        label.numberOfLines = 0
         label.textColor = .black
         return label
    }
    func getBtn(action: UIAction, text: String) -> UIButton {
        let btn = UIButton(primaryAction: action)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(text, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 19/255, green: 81/255, blue: 202/255, alpha: 1)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 20
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return btn
    }
}
