//  File: APICaller.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 3/13/25.
//  API Site: https://restcountries.com/

import UIKit

class APICaller
{
    static let shared       = APICaller()
    let baseURLString       = "https://restcountries.com/v3.1/all"
    
    func fetchSomething(completed: @escaping(Result<Data, CFError>) -> Void) -> Void
    {
        guard let url   = URL(string: baseURLString) else { return }
        
        /**
         unlike URLSession.shared.data(from: url),
         ...dataTask(with: url) does not throw
         ... & accounts for erros more cleanly in completion
         
         Lastly, instead of referencing self.parseJSON() in the dataTask completion handler
         ... just send said data back to what called it then send it back to said parser
         ... this allows me to extrapolate the JSON functionality for more legibility
         ... old code: if error == nil && data !=  nil { self.parseJSON(jsonData: data) }
         */
                
        let dataTask    = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil && data !=  nil { completed(.success(data!)) }
            else { completed(.failure(.invalidData)) }
        }
        
        dataTask.resume()
        return
    }
    
    
    func parseJSON(jsonData: Data) -> [CountryItem]
    {
        var decodedJSON = [CountryItem]()
        var countryArray: [CountryItem]
        let decoder = JSONDecoder()
        
        do { decodedJSON = try decoder.decode([CountryItem].self, from: jsonData) }
        catch { print("Error in JSON parsing = \(error)") }
        
        countryArray = decodedJSON
//        print("decoded countryArray = \(countryArray)")
        return countryArray
    }
}
