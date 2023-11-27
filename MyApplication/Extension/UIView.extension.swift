//
//  UIView.extension.swift
//  MyApplication
//
//  Created by apple on 27.11.2023.
//

import UIKit

extension UIView {
    static func config<T: UIView>(_ view: T, _ block:(T) -> ()) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        block(view)
        return view
    }
}
