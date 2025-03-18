//
//  APICaller.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/13/25.
//
/** API Site: https://restcountries.com/ */

import UIKit

class APICaller
{
    static let shared       = APICaller()
    let baseURLString       = "https://restcountries.com/v3.1/all"
    var countryArray        = [CountryItem]()
    
    func fetchCountries() async throws -> [CountryItem]
    {
        guard let url   = URL(string: baseURLString) else { throw CFError.invalidURL}
        let (data, _)   = try await URLSession.shared.data(from: url)
        
        let decoder             = JSONDecoder()
        guard let decodedJSON   = try? decoder.decode(CountryItems.self, from: data)
        else { throw CFError.failedToGetData }
        
        countryArray = decodedJSON.results
        print("countryarray = \(countryArray)")
        
//        parseJSON(json: data)
        return countryArray
    }
    
    
//    func parseJSON(json: Data)
//    {
//        let decoder             = JSONDecoder()
//        
//        if let decodedJSON    = try? decoder.decode(CountryItems.self, from: json) {
//            countryArray = decodedJSON.results
//            print("decoded countryArray = \(countryArray)")
//        }
//    }
}
