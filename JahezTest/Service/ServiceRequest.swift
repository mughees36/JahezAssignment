//
//  ServiceRequest.swift
//  JahezTest
//
//  Created by Mughees Mustafa on 08/03/2022.
//

import Foundation

struct ServiceRequest: Request {
    
    var urlRequest: URLRequest {
        return URLRequest(url: url)
    }
    
    var url: URL
    
}
