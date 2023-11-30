//
//  TabelDataSecond.swift
//  MyApplication
//
//  Created by apple on 30.11.2023.
//

import Foundation
//вторая модель данных
struct TableDataSecond: Identifiable {
    let id: String = UUID().uuidString // генерируем уникальную строку
    
    let photoForCollection: String
    let photoForTible: String
    
    static func getTableData() -> [TableDataSecond] {
        return [
            TableDataSecond(photoForCollection: "img1", photoForTible: "img2"),
            TableDataSecond(photoForCollection: "img1", photoForTible: "img2"),
            TableDataSecond(photoForCollection: "img1", photoForTible: "img2"),
            TableDataSecond(photoForCollection: "img1", photoForTible: "img2"),
            TableDataSecond(photoForCollection: "img1", photoForTible: "img2"),
            TableDataSecond(photoForCollection: "img1", photoForTible: "img2")
        ]
    }
    
    
}
