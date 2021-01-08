//
//  PhotoResponse.swift
//  AMFramework1
//
//  Created by Amrendra Roy on 08/01/21.
//

import Foundation

public struct PhotoResponse: Decodable {
    let albumId: Int?
    public let id: Int?
    public let title: String?
    public let url: String?
    public let thumbnailUrl: String?
    
    
}



//{
//    "albumId": 1,
//    "id": 1,
//    "title": "accusamus beatae ad facilis cum similique qui sunt",
//    "url": "https://via.placeholder.com/600/92c952",
//    "thumbnailUrl": "https://via.placeholder.com/150/92c952"
//  }
