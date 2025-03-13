//
//  CountryItem.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/12/25.
//

import UIKit

struct CountryItems: Codable
{
    var results: [CountryItem]
}

struct CountryItem: Codable
{
    let name: String
    let capital: String
    let currency: String
    let size: Double
    let population: Double
    let imageName: String
    var facts = [String]()
    // look for the facts using the name then access a json containing it
}
