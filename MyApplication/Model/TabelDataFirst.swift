//
//  TabelData.swift
//  MyApplication
//
//  Created by apple on 30.11.2023.
//

import Foundation

//Первая модель данных
struct TableDataFirst: Identifiable {
    let id: String = UUID().uuidString // генерируем уникальную строку
   
    
    let mainTitle: String
    let photo: String
    let text: String
    
    let backgroundColorR: Int
    let backgroundColorG: Int
    let backgroundColorB: Int
    
    
    
    static func getTableData() -> [TableDataFirst] {
        return [
            TableDataFirst(mainTitle: "Error Nil", photo: "boy", text: "Lorem ipsum dolor sit amet, consectetur adipisicing", backgroundColorR: 22, backgroundColorG: 160, backgroundColorB: 133),
            TableDataFirst(mainTitle: "", photo: "board", text: "Duis aute irure dolor in reprehenderit in voluptate velit esse", backgroundColorR: 52, backgroundColorG: 152, backgroundColorB: 219),
            TableDataFirst(mainTitle: "", photo: "paint", text: "sunt in culpa qui officia", backgroundColorR:  142, backgroundColorG: 68, backgroundColorB: 173)
        ]
    }
    
    
}


