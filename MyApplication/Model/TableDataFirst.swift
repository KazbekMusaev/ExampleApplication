//
//  TableDataFirst.swift
//  MyApplication
//
//  Created by apple on 03.12.2023.
//

import Foundation

struct TableDataFirst {
    let photo: String
    
    static func getTableData() -> [TableDataFirst] {
        return [
        TableDataFirst(photo: "img1"),
        TableDataFirst(photo: "img2"),
        TableDataFirst(photo: "img3")
        ]
    }
}
