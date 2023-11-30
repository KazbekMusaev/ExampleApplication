//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableData: [TableDataFirst] = TableDataFirst.getTableData()

    private func config(_ data: TableDataFirst, view: UIView, check: Int) {
        view.backgroundColor = UIColor(red: CGFloat(data.backgroundColorR)/255, green: CGFloat(data.backgroundColorG)/255, blue: CGFloat(data.backgroundColorB)/255, alpha: 1)
        
        let image: UIImageView = {
            $0.contentMode = .scaleAspectFit
            $0.frame = CGRect(x: 40, y: 360, width: 300, height: 300)
            $0.clipsToBounds = true
            return $0
        }(UIImageView(image: UIImage(named: data.photo)))
        
        let mainTitle: UILabel = {
            $0.font = .boldSystemFont(ofSize: 40)
            $0.textColor = .white
            $0.frame = CGRect(x: 27, y: 69, width: 170, height: 70)
            $0.text = data.mainTitle
            return $0
        }(UILabel())
        
        let textLabel: UILabel = {
            $0.font = .boldSystemFont(ofSize: 30)
            $0.textColor = .white
            $0.frame = CGRect(x: 27, y: 140, width: view.frame.width - 54, height: 140)
            $0.numberOfLines = 0
            $0.text = data.text
            return $0
        }(UILabel())

        view.addSubview(textLabel)
        view.addSubview(mainTitle)
        view.addSubview(image)
        
        
        let btnSignInAction = UIAction { _ in
            print("Вы вошли в систему")
        }
        
        let btnSingIn: UIButton = {
            $0.clipsToBounds = true
            $0.backgroundColor = .white
            $0.setTitle("Войти", for: .normal)
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 40
            $0.frame.size = CGSize(width: view.frame.width - 40, height: 60)
            $0.frame.origin.x = 20
            $0.frame.origin.y = view.frame.maxY - 110
            return $0
        }(UIButton(primaryAction: btnSignInAction))
        
        let btnRegistredAction = UIAction { _ in
            print("Вы зарегистрировались")
        }
        
        let btnRegistred: UIButton = {
            $0.setTitle("Регистрация", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.frame.size = CGSize(width: 120, height: 30)
            $0.frame.origin.y = view.frame.maxY - 50
            $0.frame.origin.x = 140
            return $0
        }(UIButton(primaryAction: btnRegistredAction))
        
        
        if check == tableData.count-1 {
            view.addSubview(btnSingIn)
            view.addSubview(btnRegistred)
            textLabel.frame.origin.y = 100
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionSlider)
        collectionSlider.frame = view.frame
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 0
        $0.minimumInteritemSpacing = 0
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionSlider: UICollectionView = {
        $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        $0.frame = view.bounds
        $0.showsHorizontalScrollIndicator = false
        $0.isPagingEnabled = true
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tableData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionSlider.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        config(tableData[indexPath.item], view: cell, check: indexPath.item)
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
}
