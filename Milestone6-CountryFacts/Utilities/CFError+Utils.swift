//
//  CFError+Utils.swift
//  Milestone6-CountryFacts
//
//  Created by Noah Pope on 3/18/25.
//

import Foundation

enum CFError: String, Error
{
    case invalidURL         = "The URL passed is invalid"
    case failedToGetData    = "Failed to get the data"
}
