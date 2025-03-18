//
//  APICaller.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/13/25.
//
/** API Site: https://restcountries.com/ */

import UIKit

enum CFError: String, Error
{
    case invalidURL = "The URL passed is invalid"
}

#warning("having issues w APICaller and calling an async func in homeVC's fetchCountryArray")

class APICaller
{
    static let shared       = APICaller()
    let baseURLString       = "https://restcountries.com/v3.1/all"
    var countryArray        = [CountryItem]()
    
    func getCountries() async throws -> [CountryItem]
    {
        guard let url   = URL(string: baseURLString) else { throw CFError.invalidURL}
        let (data, _)   = try await URLSession.shared.data(from: url)
        parseJSON(json: data)
        return countryArray
    }
    
    
    func parseJSON(json: Data)
    {
        let decoder             = JSONDecoder()
        
        if let decodedJSON    = try? decoder.decode(CountryItems.self, from: json) {
            countryArray = decodedJSON.results
        }
    }
}
