//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit


protocol ViewControllerDelegate {
    func setLhsValue(text: String?)
    func setRhsValue(text: String?)
    func setOperation(operation: String?)
    func setResult(lhs: String?, operation: String?, rhs: String?)
}


class ViewController: UIViewController {
    
    func setLhsValue(text: String?) {
        self.lhsLabel.text = text
    }
    func setRhsValue(text: String?) {
        self.rhsLabel.text = text
    }
    func setOperation(operation: String?){
        self.operation.text = operation
    }
    func setResult(lhs: String?, operation: String?, rhs: String?) {
        guard let lhsString = lhs else { return }
        guard let rhsString = rhs else { return }
        guard let operation = operation else { return }
        guard let lhsInt = Int(lhsString) else { return }
        guard let rhsInt = Int(rhsString) else { return }
        var result = Int()
        switch operation {
        case "+":
            result = lhsInt + rhsInt
        case "-":
            result = lhsInt - rhsInt
        case "/":
            result = lhsInt / rhsInt
        case "*":
            result = lhsInt * rhsInt
        default : ()
        }
        self.result.text = String(result)
        self.resultOperation.isHidden = false
    }
    
    let secondView = CalculateViewController()
    
    lazy var resultTitle: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 0, y: 214, width: 76, height: 19)
        label.text = "Результат"
        label.font = .systemFont(ofSize: 16)
        label.center.x = view.center.x
        label.textColor = .black
        return label
    }()
    
    lazy var lhsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 243, width: 50, height: 56)
        return label
    }()
    
    lazy var rhsLabel: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 170, y: 243, width: 50, height: 56)
        return label
    }()
    
    lazy var operation: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 95, y: 243, width: 50, height: 56)
        return label
    }()
    
    lazy var resultOperation: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 250, y: 243, width: 50, height: 56)
        label.text = "="
        label.isHidden = true
        return label
    }()
    
    lazy var result: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 320, y: 243, width: 50, height: 56)
        return label
    }()
    
    
    
    lazy var mainTitle: UILabel = {
       let label = UILabel()
        label.text = "Калькулятор"
        label.textColor = .black
        label.frame = CGRect(x: 0, y: 58, width: 158, height: 29)
        label.center.x = view.center.x
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var calculateBtn: UIButton = {
       let btn = UIButton(primaryAction: calculateBtnAction)
        btn.setTitle("Калькулировать", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 350, height: 54)
        btn.center = view.center
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0, green: 133/255, blue: 1, alpha: 1)
        return btn
    }()
    
    lazy var calculateBtnAction = UIAction { _ in
        let vc = CalculateViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(calculateBtn)
        view.addSubview(mainTitle)
        view.addSubview(resultTitle)
        view.addSubview(lhsLabel)
        view.addSubview(operation)
        view.addSubview(rhsLabel)
        view.addSubview(result)
        view.addSubview(resultOperation)
    }
}

extension ViewController : ViewControllerDelegate {
    
}
