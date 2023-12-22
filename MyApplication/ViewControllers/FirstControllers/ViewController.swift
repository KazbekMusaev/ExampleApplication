//
//  ViewController.swift
//  MyApplication
//
//  Created by apple on 08.11.2023.
//

import UIKit


//Просмоторщик картинок

protocol ViewControllerDelegate {
    func presentFullImageController(photo: String)
}

final class ViewController: UIViewController {
    
    
    private let modelData = PhotoViewerData.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = number
        view.addSubview(collectionPhotoViewer)
    }
    
    lazy var viewByFrame: UIView = {
        return $0
    }(UIView(frame: view.frame))
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 0
        $0.scrollDirection = .vertical
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionPhotoViewer: UICollectionView = {
        $0.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseID)
        $0.dataSource = self
        $0.delegate = self
        $0.backgroundColor = .lightGray
        return $0
    }(UICollectionView(frame: self.view.frame, collectionViewLayout: layout))
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseID, for: indexPath) as? PhotoCell {
            cell.config(data: modelData[indexPath.item], view: view)
            cell.delegate = self
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 20, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
extension ViewController: UICollectionViewDelegate {
    
}
extension ViewController: ViewControllerDelegate {
    func presentFullImageController(photo: String) {
        let vc = FullImage()
        vc.photoName = photo
        navigationController?.pushViewController(vc, animated: true)
    }
}



