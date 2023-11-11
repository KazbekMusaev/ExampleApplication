//
//  CalculateViewController.swift
//  MyApplication
//
//  Created by apple on 11.11.2023.
//

import UIKit

final class CalculateViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: ViewControllerDelegate?

    lazy var mainTitle : UILabel = {
        let label = UILabel()
        label.text = "Ввести данные"
        label.frame = CGRect(x: 0, y: 58, width: 184, height: 29)
        label.center.x = view.center.x
        label.textColor = .black
        label.font = .systemFont(ofSize: 24)
        return label
    }()
    
    lazy var firstValueTextField : UITextField = {
       let textField = UITextField()
        textField.frame = CGRect(x: 30, y: 123, width: 162, height: 55)
        textField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        textField.placeholder = "число 1"
        textField.textColor = .black
        textField.tag = 1
        textField.delegate = self
        return textField
    }()
    
    lazy var secondValueTextField : UITextField = {
       let textField = UITextField()
        textField.frame = CGRect(x: 210, y: 123, width: 152, height: 55)
        textField.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 1)
        textField.placeholder = "число 2"
        textField.textColor = .black
        return textField
    }()
    
    lazy var plusBtn: UIButton = {
        let btn = UIButton(primaryAction: plusBtnAction)
        btn.frame = CGRect(x: 30, y: 239, width: 63, height: 63)
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 133/255, blue: 1, alpha: 1)
        return btn
    }()
    
    lazy var plusBtnAction = UIAction { _ in
        self.delegate?.setLhsValue(text: self.firstValueTextField.text)
        self.delegate?.setRhsValue(text: self.secondValueTextField.text)
        self.delegate?.setOperation(operation: "+")
        self.delegate?.setResult(lhs: self.firstValueTextField.text, operation: "+", rhs: self.secondValueTextField.text)
    }
    
    lazy var minusBtn: UIButton = {
        let btn = UIButton(primaryAction: minusBtnAction)
        btn.frame = CGRect(x: 123, y: 239, width: 63, height: 63)
        btn.setTitle("-", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 133/255, blue: 1, alpha: 1)
        return btn
    }()
    
    lazy var minusBtnAction = UIAction { _ in
        self.delegate?.setLhsValue(text: self.firstValueTextField.text)
        self.delegate?.setRhsValue(text: self.secondValueTextField.text)
        self.delegate?.setOperation(operation: "-")
        self.delegate?.setResult(lhs: self.firstValueTextField.text, operation: "-", rhs: self.secondValueTextField.text)
    }
    
    lazy var divisionBtn: UIButton = {
        let btn = UIButton(primaryAction: divisionBtnAction)
        btn.frame = CGRect(x: 216, y: 239, width: 63, height: 63)
        btn.setTitle("/", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 133/255, blue: 1, alpha: 1)
        return btn
    }()
    
    lazy var divisionBtnAction = UIAction { _ in
        self.delegate?.setLhsValue(text: self.firstValueTextField.text)
        self.delegate?.setRhsValue(text: self.secondValueTextField.text)
        self.delegate?.setOperation(operation: "/")
        self.delegate?.setResult(lhs: self.firstValueTextField.text, operation: "/", rhs: self.secondValueTextField.text)
    }
    
    lazy var multipliBtn: UIButton = {
        let btn = UIButton(primaryAction: multipliBtnAction)
        btn.frame = CGRect(x: 309, y: 239, width: 63, height: 63)
        btn.setTitle("*", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 133/255, blue: 1, alpha: 1)
        return btn
    }()
    
    lazy var multipliBtnAction = UIAction { _ in
        self.delegate?.setLhsValue(text: self.firstValueTextField.text)
        self.delegate?.setRhsValue(text: self.secondValueTextField.text)
        self.delegate?.setOperation(operation: "*")
        self.delegate?.setResult(lhs: self.firstValueTextField.text, operation: "*", rhs: self.secondValueTextField.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(mainTitle)
        view.addSubview(firstValueTextField)
        view.addSubview(secondValueTextField)
        
        view.addSubview(plusBtn)
        view.addSubview(minusBtn)
        view.addSubview(divisionBtn)
        view.addSubview(multipliBtn)
    }
}

