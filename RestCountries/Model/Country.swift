//
//  Country.swift
//  RestCountries
//
//  Created by kraujalis.rolandas on 15/11/2023.
//

import Foundation

struct Name: Codable {
    let common, official: String?
}

struct Country: Codable {
    let name: Name
    let flag: String?
    let region: String?
    let borders: [String]?
    let capital: [String]?
    let population: Int?
    let languages: [String: String]?
}
