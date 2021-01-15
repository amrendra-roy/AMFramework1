//
//  FrameOne.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 05/01/21.
//

import Foundation
//import RxCocoa

public class FrameOne {
    
    public init() {
        
    }
    
    public func printFrameworkOne() {
        logMe()
    }
}

extension FrameOne {
    private func logMe() {
        print("print by Framework One by private method")
    }
}
