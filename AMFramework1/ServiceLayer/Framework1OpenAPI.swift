//
//  Framework1OpenAPI.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 08/01/21.
//

import Foundation

//Provide this File to external parties to consume your APIs
protocol Framework1OpenAPI {
    /*
     Detail: Method that will return list for Movies by url
     Input: Movies URL
     Output: List of movies and error type if any
     */
    func getMovieList(by url: URL?,handler: @escaping(Result<[MovieResponse]?, Framwork1Error>) -> Void)  //Required method
    
    
    /*
    Detail: Method that will return list for Photos by url
    Input: Photo URL
    Output: List of photo and error type if any
    */
    func getPhotosList(by url: URL?, handler: @escaping(Result<[PhotoResponse]?, Framwork1Error>) -> Void) //Required method
    
    
    
    /*
     Detail: Method that will return list for Comments by url
     Input: Comments URL
     Output: List of Comments and error type if any
     */
    //test url: https://jsonplaceholder.typicode.com/posts
    func getPostCommentsList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) //Optional method
 
}

extension Framework1OpenAPI {
    // write down optional  method here
    func getPostCommentsList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) {
        
    }
}
