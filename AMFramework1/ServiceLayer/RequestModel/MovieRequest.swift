//
//  MovieRequest.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

struct MovieRequest: Codable {
    //No request paramter required, so don't add any property here
    
    
}

extension MovieRequest: Endpoint {
//    var path: String {
//        return ""
//    }
    var request: URLRequest {
        var request = URLRequest(url: self.url)
        request.httpMethod = "POST"
        request.httpBody = self.jsonPropertyDatabody()
        return request
    }
    
}
