//
//  Models.swift
//  UniversitiesAPIApp
//
//  Created by Mac on 07/12/2023.
//

import Foundation


struct Country: Identifiable, Codable, Hashable {
    
    var id = UUID().uuidString
    var name: CountryName
    var independent: Bool? = false
    var unMember: Bool
    var flags: Flag
    
    enum CodingKeys: CodingKey{
        case name, independent, unMember, flags
    }
    
}

struct CountryName: Codable, Hashable{
    
    var common = ""
    var official = ""
    
    enum CodingKeys: CodingKey{
        case common, official
    }
    
}

struct Flag: Codable, Hashable{
    
    var png = ""
    
    enum CodingKeys: CodingKey{
        case png
    }
}
