//
//  Endpoint.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 06/01/21.
//

import Foundation

enum Result<Template, U> where U: Error {
    case success(Template)
    case failue(U)
}

