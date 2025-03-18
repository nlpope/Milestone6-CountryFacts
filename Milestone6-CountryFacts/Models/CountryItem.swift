//
//  CountryItem.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/12/25.
//

import UIKit

/**api = https://restcountries.com/v3.1/all**/
struct CountryItems: Codable { let results: [CountryItem] }

struct CountryItem: Codable
{
    let name: Name
    let capital: String
    let currency: String
    let size: Double
    let population: Double
    let flagImageName: String
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case capital
        case currency
        case size       = "area"
        case population
        case flagImageName
    }
}


struct Name: Codable
{
    var common: String
    var official: String
}

