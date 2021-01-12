//
//  APIServiceManager.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation
import UIKit

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

extension APIServiceManager: Framework1OpenAPI {
    public func instantiatePayment(with payeeName: String, completionHandler: @escaping (String, Framwork1Error?) -> Void) -> UIViewController? {
        if let vc = EnterPinViewController.instantiateEnterPinViewController(with: payeeName) {
            vc.completionHandler = { (message, errorType) in
                //call when Enter pin completion handler call back
                //print("message = \(message)")
                //print("Error type = \(errorType)")
                completionHandler(message, errorType)
            }
            return vc
        }
        return nil
    }
    
    
    public func getMovieList(by url: URL?,handler: @escaping(Result<[MovieResponse]?, Framwork1Error>) -> Void) {
        fetch(with: URL(string: baseURLFramework1), handler: handler)
    }
    
    public func getPhotosList(by url: URL?, handler: @escaping(Result<[PhotoResponse]?, Framwork1Error>) -> Void) {
        fetch(with: URL(string: baseURLFramework1), handler: handler)
    }
}
