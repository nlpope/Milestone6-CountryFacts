//
//  CountryItem.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/12/25.
//
/**api = https://restcountries.com/v3.1/all**/


import UIKit

#warning("problem child: I get unnamed [{}] as resp. instead of {} named 'results'")
struct CountryItems: Codable { let results: [[CountryItem]] }

struct CountryItem: Codable
{
    var name: Name
//    let capital: String
//    let size: Double
//    let population: Double
//    let flagImageName: Flag
    
    enum CodingKeys: String, CodingKey
    {
        case name
//        case capital
//        case size           = "area"
//        case population
//        case flagImageName  = "flags"
    }
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

