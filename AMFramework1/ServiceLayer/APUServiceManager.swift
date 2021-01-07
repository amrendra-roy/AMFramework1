//
//  APIServiceManager.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

//https://api.androidhive.info/json/movies.json
//https://jsonplaceholder.typicode.com/photos
//https://jsonplaceholder.typicode.com/posts

public var baseURLFramework1 = "https://no/url/" //set it from out side while initialising framework, only once

public enum EnvironmentConfig: String {
    case dev = "https://api.androidhive.info/json/movies.json"
    case staging = "https://jsonplaceholder.typicode.com/photos"
    case staging2 = "https://google.com"
}

public class APIServiceManager: APIClientManager {
    
    var session: URLSession = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30 // seconds
            //configuration.timeoutIntervalForResource = 30 // seconds
            configuration.httpAdditionalHeaders = ["Content-Type":"text/html"] //text/html //application/json
            return URLSession(configuration: configuration)
        }()
    

    public init(with environment: EnvironmentConfig = .staging2) {
        baseURLFramework1 = environment.rawValue
    }
}

extension APIServiceManager {
    public func getMovieList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) {
        let movieReqeust = MovieRequest()
        let request = movieReqeust.request
        fetch(wtih: request, handler: handler)
    }
    
    public func getMovieList(by url: URL?,handler: @escaping(Result<[MovieResponse]?, Framwork1Error>) -> Void) {
        fetch(with: URL(string: baseURLFramework1), handler: handler)
    }
    
    /*public func getPhotosList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) {
        
    }
    
    public func getPostCommentsList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) {
        
    }*/
}
