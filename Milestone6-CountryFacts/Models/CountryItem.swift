//  CountryItem.swift
//  Milestone6-CountryFacts
//  Created by Noah Pope on 3/12/25.
//  api = https://restcountries.com/v3.1/all

import UIKit

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


struct Flag: Codable
{
    var png: String
}
