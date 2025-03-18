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
    static let shared   = APICaller()
    let baseURL         = "https://restcountries.com/v3.1/all"
    var countryArray        = [CountryItem]()
    
    func getCountries() -> [CountryItem]
    {

        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: self.baseURL) {
                if let data = try? Data(contentsOf: url) {
                    countryArray = self.parseJSON(json: data)
                }
            }
        }
    }
    
    
    func parseJSON(json: Data)
    {
        var countryArray        = [CountryItem]()
        let decoder             = JSONDecoder()
        
        if let jsonCountries    = try? decoder.decode(CountryItems.self, from: json) {
            countryArray = jsonCountries.results
        }
        
        return countryArray
    }
}
