//  File: CFError+Utils.swift
//  Project: Milestone6-CountryFacts
//  Created by: Noah Pope on 3/18/25.

import Foundation

enum CFError: String, Error
{
    case invalidURL         = "The URL passed is invalid."
    case failedToGetData    = "Failed to get the data."
    case invalidData        = "The data received is invalid."
}
