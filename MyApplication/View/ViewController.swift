//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    func config(_ data: TableDataFirst, view: UIView) {
        let image: UIImageView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentMode = .scaleAspectFill
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 30
            return $0
        }(UIImageView(image: UIImage(named: data.photo)))
        
        view.addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private lazy var collection: UICollectionView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        return $0
    }(UICollectionViewFlowLayout())
    
    private let tableDataFirst = TableDataFirst.getTableData()
    
    private let tableDataSecond = TableDataSecond.getTabelData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.register(PostCell.self, forCellReuseIdentifier: PostCell.getId)
        $0.frame = view.bounds
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: .zero, style: .insetGrouped))
}



extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            1
        case 1:
            tableDataSecond.count
        default:
            0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let tableCell = tableView.dequeueReusableCell(withIdentifier: PostCell.getId, for: indexPath) as? PostCell {
            switch indexPath.section {
            case 0:
                cell.addSubview(collection)
                collection.frame = cell.frame
            case 1:
                tableCell.config(tableDataSecond[indexPath.row])
                return tableCell
            default: ()
            }
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
}

extension ViewController: UITableViewDelegate, UICollectionViewDelegate  {
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tableDataFirst.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        config(tableDataFirst[indexPath.item], view: cell)
        cell.backgroundColor = .brown
        return cell
    }
    
    
}

