//
//  MovieData.swift
//  ios-movies-api-swiftui
//
//  Created by Matteo Pasotti on 21/05/2020.
//  Copyright © 2020 Matteo Pasotti. All rights reserved.
//

import Foundation

struct Movies : Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let vote_average: Double
    var image: String {
        if poster_path != nil {
            return "http://image.tmdb.org/t/p/w780\(poster_path!)"
        } else {
            return ""
        }
        
    }
}
