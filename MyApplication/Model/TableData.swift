//
//  TableData.swift
//  MyApplication
//
//  Created by apple on 22.12.2023.
//

import Foundation

struct TableData {
    let name: String
    let image: String
    
    static func getData() -> [TableData] {
        return[
        TableData(name: "Настройка", image: "gear"),
        TableData(name: "Профиль", image: "person"),
        TableData(name: "Новости", image: "newspaper")
        ]
    }
}
