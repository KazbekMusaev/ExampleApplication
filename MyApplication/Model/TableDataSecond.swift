//
//  TableDataSecond.swift
//  MyApplication
//
//  Created by apple on 03.12.2023.
//

import Foundation

struct TableDataSecond {
    let photo: String
    
    static func getTabelData() -> [TableDataSecond] {
        return [
        TableDataSecond(photo: "img4"),
        TableDataSecond(photo: "img5"),
        TableDataSecond(photo: "img6"),
        TableDataSecond(photo: "img7")
        ]
    }
}
