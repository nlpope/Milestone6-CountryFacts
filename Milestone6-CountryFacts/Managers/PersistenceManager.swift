//  File: PersistenceManager.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 6/4/25.

import Foundation

enum PersistenceManager
{
    static private let defaults = UserDefaults.standard

    static var isFirstVisitStatus: Bool! = fetchFirstVisitStatus() {
        didSet { PersistenceManager.saveFirstVisitStatus(status: self.isFirstVisitStatus) }
    }

    //-------------------------------------//
    // MARK: - SAVE / FETCH FIRST VISIT STATUS (FOR LOGO LAUNCHER)

    static func saveFirstVisitStatus(status: Bool)
    {
        do {
            let encoder = JSONEncoder()
            let encodedStatus = try encoder.encode(status)
            defaults.set(encodedStatus, forKey: SaveKeys.isFirstVisit)
        } catch {
            print("failed ato save visit status"); return
        }
    }


    static func fetchFirstVisitStatus() -> Bool
    {
        guard let visitStatusData = defaults.object(forKey: SaveKeys.isFirstVisit) as? Data
        else { return true }
        
        do {
            let decoder = JSONDecoder()
            let fetchedStatus = try decoder.decode(Bool.self, from: visitStatusData)
            return fetchedStatus
        } catch {
            print("unable to load first visit status")
            return true
        }
    }

}
