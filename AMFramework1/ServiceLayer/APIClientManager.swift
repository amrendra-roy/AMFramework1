//
//  APIClientManager.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation


protocol APIClientManager {
    var session: URLSession { get }
    func fetch()
}

extension APIClientManager {
    func fetch() {
        
    }
}
