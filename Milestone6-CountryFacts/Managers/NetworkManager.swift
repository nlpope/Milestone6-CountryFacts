//
//  NetworkManager.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/13/25.
//

import Foundation

enum NetworkManager
{
    static func getCountries()
    {
        
    }
    
    
    static func parseJSON(json: Data) -> [CountryItem]
    {
        var countryArray        = [CountryItem]()
        let decoder             = JSONDecoder()
        
        if let jsonCountries    = try? decoder.decode(CountryItems.self, from: json) {
            countryArray = jsonCountries.results
        }
        
        return countryArray
    }
}
