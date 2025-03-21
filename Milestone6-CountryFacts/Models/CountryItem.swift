//  CountryItem.swift
//  Milestone6-CountryFacts
//  Created by Noah Pope on 3/12/25.
//  api = https://restcountries.com/v3.1/all

import UIKit

/**
 Instead of using Sean Allen's CountryResult: [CountryItem] method
 ... I'm just declaring the singular type here and acccounting for the payload being an array
 ... by puting 'decoder.decode([CountryItem].self, from: jsonData)' in the APICaller
 */

struct CountryItem: Codable
{
    var name: Name?
    var capital: [String]?
    var size: Double?
    var population: Double?
    var flagImageName: Flag?
    
    private enum CodingKeys: String, CodingKey
    {
        case name
        case capital
        case size           = "area"
        case population
        case flagImageName  = "flags"
    }
}


struct Name: Codable
{
    var common: String
    var official: String
}


struct Shp: Codable
{
    let name, symbol: String
}


struct Flag: Codable
{
    var png: String
}
