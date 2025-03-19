//  APICaller.swift
//  Milestone6-CountryFacts
//  Created by Noah Pope on 3/13/25.
//  API Site: https://restcountries.com/
/**
 unlike URLSession.shared.data(from: url),
 ...dataTask(with: url) does not throw & accounts for erros more cleanly in completion
 **/

import UIKit

class APICaller
{
    static let shared       = APICaller()
    let baseURLString       = "https://restcountries.com/v3.1/all"
    var countryArray        = [CountryItem]()
    
    
    
    func fetchSomething() -> [CountryItem]
    {
        guard let url   = URL(string: baseURLString) else { return countryArray }
        
        #warning("this is accessed too late")
        let dataTask    = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data !=  nil { self.parseJSON(jsonData: data!) }
            else { print("data = \(String(describing: data)) \n error = \(String(describing: error))") }
        }
        
        dataTask.resume()
        return countryArray
    }
    
    
    func parseJSON(jsonData: Data)
    {
        print("accessing parse JSON")
        var decodedJSON = [CountryItem]()
        let decoder = JSONDecoder()
        
        do { decodedJSON = try decoder.decode([CountryItem].self, from: jsonData) }
        catch { print("Error in JSON parsing = \(error)") }
        
        countryArray = decodedJSON
        print("decoded countryArray = \(countryArray)")
    }
}
