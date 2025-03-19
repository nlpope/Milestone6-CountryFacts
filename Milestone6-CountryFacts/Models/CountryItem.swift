//  CountryItem.swift
//  Milestone6-CountryFacts
//  Created by Noah Pope on 3/12/25.
//  api = https://restcountries.com/v3.1/all

import UIKit

//struct CountryItems: Codable { let results: [CountryItem] }

struct CountryItem: Codable
{
    var name: Name?
    var capital: [String]?
    var size: Double?
    var population: Double?
//    var flagImageName: Flag?
    
    private enum CodingKeys: String, CodingKey
    {
        case name
        case capital
        case size           = "area"
        case population
//        case flagImageName  = "flags"
    }
    
    
//    init(from decoder: Decoder) throws
//    {
//        if let countryContainer = try? decoder.unkeyedContainer() {
//            if let nestedContainer = try? countryContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .name) {
//                self.name           = try nestedContainer.decode(Name.self, forKey: .name)
//                self.capital        = try countryContainer.decode(String.self, forKey: .capital)
//                self.size           = try countryContainer.decode(Double.self, forKey: .size)
//                self.population     = try countryContainer.decode(Double.self, forKey: .population)
//                self.flagImageName  = try countryContainer.decode(Flag.self, forKey: .flagImageName)
//            }
//            
//        }
//    }
}


struct Name: Codable
{
    var common: String
    var official: String
}


//struct Flag: Codable
//{
//    var png: String
//}
