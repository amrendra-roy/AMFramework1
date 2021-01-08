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
            configuration.httpAdditionalHeaders = ["Content-Type":"application/json"] //text/html //application/json
            return URLSession(configuration: configuration)
        }()
    

    public init(with environment: EnvironmentConfig = .staging2) {
        baseURLFramework1 = environment.rawValue
    }
}

extension APIServiceManager {
    
    public func getMovieList(by url: URL?,handler: @escaping(Result<[MovieResponse]?, Framwork1Error>) -> Void) {
        fetch(with: URL(string: baseURLFramework1), handler: handler)
    }
    
    public func getPhotosList(by url: URL?, handler: @escaping(Result<[PhotoResponse]?, Framwork1Error>) -> Void) {
        fetch(with: URL(string: baseURLFramework1), handler: handler)
    }
    
    /*public func getPhotosList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) {
        
    }
    
    public func getPostCommentsList(handler: @escaping(Result<MovieResponse?, Framwork1Error>) -> Void) {
        
    }*/
}
