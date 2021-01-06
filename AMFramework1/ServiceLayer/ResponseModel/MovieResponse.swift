//
//  MovieResponse.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

class MovieResponse: Decodable {
    let title: String?
    let image: String? //imageURL do as coding-key value
    let rating: Float?
    let releaseYear: Int?
    let genre: [String]
    
    init(movieTitle: String, imageURL: String, rating: Float, releaseYear: Int, genreList: [String] ) {
        title = movieTitle
        image = imageURL
        self.rating = rating
        self.releaseYear = releaseYear
        genre = genreList
    }
}

//"title": "Dawn of the Planet of the Apes",
//        "image": "https://api.androidhive.info/json/movies/1.jpg",
//        "rating": 8.3,
//        "releaseYear": 2014,
//        "genre": ["Action", "Drama", "Sci-Fi"]
