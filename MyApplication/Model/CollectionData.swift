//
//  MockData.swift
//  MyApplication
//
//  Created by apple on 04.01.2024.
//

import Foundation

struct Section {
    var type: String
    var header: String
    var items: [Item]
}
struct Item {
    var name: String
    var text: String
    var photo: String
}

class MockData {
    static func getData() -> [Section] {
        let sectionOneItems = [
            Item(name: "Name1", text: "", photo: "img1"),
            Item(name: "Name2", text: "", photo: "img2"),
            Item(name: "Name3", text: "", photo: "img3"),
            Item(name: "Name4", text: "", photo: "img4"),
        ]
        
        let sectionSecondItems = [
            Item(name: "Name1", text: "Some text", photo: "img1"),
            Item(name: "Name2", text: "Some text", photo: "img2"),
            Item(name: "Name3", text: "Some text", photo: "img3"),
            Item(name: "Name4", text: "Some text", photo: "img4"),
        ]
        
        let sectionOne = Section(type: "story", header: "", items: sectionOneItems)
        
        let sectionSecond = Section(type: "friends", header: "Friends", items: sectionSecondItems)
        
        
        
        return [sectionOne, sectionSecond]
    }
}
