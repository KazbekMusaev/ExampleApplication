//
//  PhotoViewerData.swift
//  MyApplication
//
//  Created by apple on 20.12.2023.
//

import Foundation

struct PhotoViewerData {
    let photo: String
    
    static func getData() -> [PhotoViewerData] {
        return [
        PhotoViewerData(photo: "img1"),
        PhotoViewerData(photo: "img2"),
        PhotoViewerData(photo: "img3"),
        PhotoViewerData(photo: "img4"),
        PhotoViewerData(photo: "img5"),
        PhotoViewerData(photo: "img6")
        ]
    }
}
