//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit

protocol ViewControllerDelegate {
    func presentWebController(index: Int, link: String)
}

final class ViewController: UIViewController {
    
    private let collectionData = ModelData.getData()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 0
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collection: UICollectionView = {
        $0.frame = view.bounds
        $0.register(PostCell.self, forCellWithReuseIdentifier: PostCell.reuseId)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: layout))
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCell.reuseId, for: indexPath) as? PostCell {
            cell.config(collectionData[indexPath.item], view: self.view)
            cell.index = indexPath.item
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.size.width - 40, height: 100)
//    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

extension ViewController: ViewControllerDelegate {
    func presentWebController(index: Int, link: String) {
        let webVC = WebViewController()
        webVC.linkId = link
        navigationController?.pushViewController(webVC, animated: true)
    }
    
    
}
