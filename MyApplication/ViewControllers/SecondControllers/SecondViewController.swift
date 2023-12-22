//
//  SecondViewController.swift
//  MyApplication
//
//  Created by apple on 19.12.2023.
//

import UIKit
import AVFoundation

final class SecondViewController: UIViewController {

    
    var cameraPosition: AVCaptureDevice.Position = .back
    //1 session
    var session: AVCaptureSession!
    //2 preview
    var preview: AVCaptureVideoPreviewLayer!
    //3 output
    var output = AVCapturePhotoOutput()
    
    private lazy var cameraChange: UIButton = {
        $0.frame = CGRect(x: view.frame.width - 60, y: 100, width: 40, height: 40)
        $0.setImage(UIImage(systemName: "arrow.triangle.2.circlepath.camera"), for: .normal)
        return $0
    }(UIButton(primaryAction: cameraChangeAction))
    
    private lazy var cameraChangeAction = UIAction { _ in
        var position: AVCaptureDevice.Position = (self.cameraPosition == .back ) ? .front : .back
        self.cameraPosition = position
        
        self.session.beginConfiguration()
        
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            for input in self.session.inputs {
                self.session.removeInput(input)
            }
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            self.session.commitConfiguration()
        } catch {
            print("Can`t change camera position")
        }
    }
    
    private lazy var shotBtn: UIButton = {
        $0.frame = CGRect(x: view.center.x - 20, y: view.frame.height - 125, width: 40, height: 40)
        $0.setImage(UIImage(systemName: "camera"), for: .normal)
        return $0
    }(UIButton(primaryAction: actionByShotBtn))
    
    private lazy var actionByShotBtn = UIAction { _ in
        self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
    
    private lazy var imageSaver: UIImageView = {
        $0.frame = CGRect(x: view.center.x - 175, y: view.frame.height - 195, width: 100, height: 100)
        $0.layer.cornerRadius = 30
        $0.isUserInteractionEnabled = true
        $0.backgroundColor = .black
        let tap = UITapGestureRecognizer(target: self, action: #selector(presentFullImageController(sender: )))
        $0.addGestureRecognizer(tap)
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        createCamera()
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = number
        view.addSubview(shotBtn)
        view.addSubview(imageSaver)
        view.addSubview(cameraChange)
       
    }
    

    private func createCamera() {
        session = AVCaptureSession()
        session.sessionPreset = .hd4K3840x2160
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Нет камеры")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: device)
            
            if session.canAddInput(input), session.canAddOutput(output) {
                session.addInput(input)
                session.addOutput(output)
            }
            
            preview = AVCaptureVideoPreviewLayer(session: session)
            preview.videoGravity = .resizeAspect
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.session.startRunning()
            }
            
            preview.frame = view.bounds
            view.layer.addSublayer(preview)
            
        } catch {
            print("Error with camera!")
        }
    }
    
    @objc
    func presentFullImageController(sender: UITapGestureRecognizer) {
        let vc = FullImageByCamera()
        vc.image = imageSaver.image
        navigationController?.pushViewController(vc, animated: true)
    }

}


extension SecondViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else { return }
        
        if let image = UIImage(data: data) {
            self.imageSaver.image = image
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}
