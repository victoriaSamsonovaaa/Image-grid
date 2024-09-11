//
//  Image.swift
//  ImageGrid
//
//  Created by Victoria Samsonova on 11.09.24.
//

import Foundation

struct APIResponse : Codable {
    let results: [Result]
}

struct Result : Codable, Identifiable {
    let id : String
    let urls : URLS
}

struct URLS : Codable {
    let regular : String
}
