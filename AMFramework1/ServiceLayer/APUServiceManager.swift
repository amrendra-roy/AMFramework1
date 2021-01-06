//
//  APUServiceManager.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

//https://api.androidhive.info/json/movies.json
//https://jsonplaceholder.typicode.com/posts
class APUServiceManager: APIClientManager {
    
    var session: URLSession = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 30 // seconds
            configuration.timeoutIntervalForResource = 30 // seconds
            return URLSession(configuration: configuration)
        }()
    
    public init() {
        
    }
    
}
