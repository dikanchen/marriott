//
//  results.swift
//  Marriott
//
//  Created by User on 3/15/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import Foundation

struct Results:Codable{
    let results: [hotel]
    
    init(results: [hotel]) {
        self.results = results
    }
}
struct hotel:Codable{
    let name: String
    let vicinity: String
    
    init(name: String, vicinity: String) {
        self.name = name
        self.vicinity = vicinity
    }
}
