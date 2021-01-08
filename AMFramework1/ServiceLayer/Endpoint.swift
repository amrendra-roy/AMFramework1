//
//  Endpoint.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

public enum Result<Template, U> where U: Error {
    case success(Template)
    case failure(U)
}

protocol Endpoint {
    //var path: String { get }
    func jsonPropertyDatabody() -> Data? // method which will prepare a http databody using all codable property of request model
}

// only codable request model can be use this
extension Endpoint where Self: Codable {
    var url: URL {
        return URL(string: baseURLFramework1)!

        //perepare url with the help of URLComponent, right now I have only url for testing
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = baseURL
//        components.path = self.path
//        return components.url!
    }
    
    func jsonPropertyDatabody() -> Data? {
        
        do {
            let jsonData = try JSONEncoder().encode(self)
            print("json https body = \(jsonData)")
            return jsonData
        } catch let error {
            print("Error while jsonDataBody = \(error.localizedDescription)")
        }
        print("Invlaid jsonDataBody ")
        return nil
    }
}
