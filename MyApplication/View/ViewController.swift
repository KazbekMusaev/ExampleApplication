//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var btnInfoAction = UIAction { _ in
//        let vc = SecondViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        print("Вы нажали на кнопку перехода окна")
    }

    private let tableData: [TabelData] = TabelData.getTableData()
    
    private lazy var table: UITableView = {
        .config($0) {
            $0.register(PostCell.self, forCellReuseIdentifier: PostCell.getId)
            $0.dataSource = self
            $0.delegate = self
            $0.separatorStyle = .none
        }
    }(UITableView(frame: self.view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = table.dequeueReusableCell(withIdentifier: PostCell.getId, for: indexPath) as? PostCell {
            cell.config(tableData[indexPath.row])
            cell.getAction(tableData[indexPath.row], btnInfoAction)
            return cell
        }
        return UITableViewCell()
    }
    
    func getImageName(_ data: TabelData) -> String {
        return data.photo
    }
    func getName(_ data: TabelData) -> String {
        return data.name
    }
    func getText(_ data: TabelData) -> String {
        return data.text
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondViewController()
        vc.data = tableData[indexPath.row]
        vc.userName.text = getName(tableData[indexPath.row])
        vc.image.image = UIImage(named: getImageName(tableData[indexPath.row]))
        vc.text.text = getText(tableData[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}

