//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private func getImage(imageName: String, height: CGFloat, width: CGFloat, cornerRadius: CGFloat) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: height),
            imageView.widthAnchor.constraint(equalToConstant: width)
        ])
        return imageView
    }
    private func getNameLabel(name: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = name
        label.textColor = .black
        return label
    }
    private func getPointLabel(point: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = point
        label.textColor = .black
        return label
    }
    private func getBtnWrite(writeText: String) -> UIButton {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle(writeText, for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        return btn
    }
    
    let items = [
    1,2,3,4
    ]
    let itemsSecond = [
    1,2,3
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        navigationItem.title = "Таблица"
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.frame = self.view.frame
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        return tableView
    }()
    
    
  
    
    
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return items.count

        case 1:
            return itemsSecond.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            self.tableView.rowHeight = 61
            switch indexPath.row {
            case 0:
                let image = getImage(imageName: "brok", height: 44, width: 44, cornerRadius: 10)
                let name = getNameLabel(name: "Брок Лестнер")
                let point = getPointLabel(point: "100")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(point)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 13),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24),
                    point.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    point.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24)
                ])
            case 1:
                let image = getImage(imageName: "capitanAmerika", height: 44, width: 44, cornerRadius: 10)
                let name = getNameLabel(name: "Капитан Америка")
                let point = getPointLabel(point: "200")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(point)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 13),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24),
                    point.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    point.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24)
                ])
            case 2:
                let image = getImage(imageName: "eagle", height: 44, width: 44, cornerRadius: 10)
                let name = getNameLabel(name: "Хабиб Нурмагомедов")
                let point = getPointLabel(point: "300")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(point)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 13),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24),
                    point.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    point.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24)
                ])
            case 3:
                let image = getImage(imageName: "hulk", height: 44, width: 44, cornerRadius: 10)
                let name = getNameLabel(name: "Халк")
                let point = getPointLabel(point: "400")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(point)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 13),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24),
                    point.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    point.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 24)
                ])
            default: ()
            }
        case 1:
            self.tableView.rowHeight = 105
            switch indexPath.row {
            case 0:
                let image = getImage(imageName: "joneBons", height: 80, width: 80, cornerRadius: 40)
                let name = getNameLabel(name: "Джон Джонс")
                let writeBtn = getBtnWrite(writeText: "написать")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(writeBtn)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 42),
                    writeBtn.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    writeBtn.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 36)
                    
                ])
            case 1:
                let image = getImage(imageName: "tony", height: 80, width: 80, cornerRadius: 40)
                let name = getNameLabel(name: "Тони Фергисон")
                let writeBtn = getBtnWrite(writeText: "написать")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(writeBtn)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 42),
                    writeBtn.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    writeBtn.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 36)
                    
                ])
            case 2:
                let image = getImage(imageName: "tor", height: 80, width: 80, cornerRadius: 40)
                let name = getNameLabel(name: "Тор")
                let writeBtn = getBtnWrite(writeText: "написать")
                cell.contentView.addSubview(image)
                cell.contentView.addSubview(name)
                cell.contentView.addSubview(writeBtn)
                
                NSLayoutConstraint.activate([
                    image.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 12),
                    image.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 10),
                    name.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
                    name.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 42),
                    writeBtn.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -20),
                    writeBtn.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 36)
                    
                ])
            default: ()
            }
        default:
            ()
        }
        
        
        return cell
    }
    
    
    
}
