//
//  JSONString.swift
//  JSONParsingTest
//
//  Created by wizard on 2022/10/17.
//

import Foundation

let jsonString = """
{
    "bts":
        [{"nick": "RM", "name": "김남준", "imageName": "bts1", "flag": "kr", "company": "하이브"},
         {"nick": "진", "name": "김석진", "imageName": "bts2", "flag": "kr", "company": "하이브"},
         {"nick": "슈가", "name": "민윤기", "imageName": "bts3", "flag": "kr", "company": "하이브"},
         {"nick": "제이홉", "name": "정호석", "imageName": "bts4", "flag": "kr", "company": "하이브"},
         {"nick": "지민", "name": "박지민", "imageName": "bts5", "flag": "kr", "company": "하이브"},
         {"nick": "뷔", "name": "김태형", "imageName": "bts6", "flag": "kr", "company": "하이브"},
         {"nick": "정국", "name": "전정국", "imageName": "bts7", "flag": "kr", "company": "하이브"}],
    "count":7
}
"""

let jsonData = Data(jsonString.utf8)

struct Member: Codable {
    let nick: String
    let name: String
    let imageName: String
    let flag: String
    let company: String
}
    
struct BTSData: Codable {
    let bts:[Member]
    let count: Int
}
