//
//  FullImage.swift
//  MyApplication
//
//  Created by apple on 20.12.2023.
//

import UIKit

final class FullImage: UIViewController {

    var photoName: String = ""
    var initialFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    lazy var photo: UIImageView = {
        let tapToInitialPosition = UITapGestureRecognizer(target: self, action: #selector(tapToNormal(sender: )))
        let tap = UITapGestureRecognizer(target: self, action: #selector(getBack(sender: )))
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto(sender: )))
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panPhoto(sender: )))
        tap.numberOfTapsRequired = 2
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
        $0.image = UIImage(named: photoName)
        $0.addGestureRecognizer(tap)
        $0.addGestureRecognizer(pinch)
        $0.addGestureRecognizer(pan)
        $0.addGestureRecognizer(tapToInitialPosition)
        initialFrame = $0.frame
        return $0
    }(UIImageView(frame: view.frame))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(photo)
        
    }
    
    @objc
    func getBack(sender: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    @objc
    func pinchPhoto(sender: UIPinchGestureRecognizer) {
        guard let gestureView = sender.view else { return }
        
        gestureView.transform = gestureView.transform.scaledBy(x: sender.scale,
                                                           y: sender.scale)
        sender.scale = 1
    }
    @objc
    func panPhoto(sender: UIPanGestureRecognizer) {
        if sender.view?.frame.width != view.frame.width {
            guard let gestureView = sender.view else { return }
            let translate = sender.translation(in: view)
            gestureView.center = CGPoint(x: gestureView.center.x + translate.x,
                                            y: gestureView.center.y + translate.y)
            sender.setTranslation(.zero, in: view)
        }
    }
    @objc
    func tapToNormal(sender: UITapGestureRecognizer) {
        sender.view?.frame = initialFrame
    }       
    
    
}
