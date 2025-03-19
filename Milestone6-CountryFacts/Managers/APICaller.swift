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
    
    #warning("find a way to parse the json & send to homeVC using new @escaping & Result - see GHFollowers NetMgr.")
    func fetchSomething(completed: @escaping(Result<[CountryItem], Error>) -> Void)
    {
        guard let url   = URL(string: baseURLString) else { return }
        
        #warning("this is accessed too late")
        let dataTask    = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if error == nil && data !=  nil { self.parseJSON(jsonData: data) }
            if error == nil && data !=  nil { completed(.success(data)) }
            else { print("nil data or error found") }
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
        return countryArray
        print("decoded countryArray = \(countryArray)")
    }
}
