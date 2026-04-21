//
//  APIError.swift
//  Lazy Loader
//
//  Created by Ankit Kumar Ojha on 16/04/26.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case invalidStatusCode(Int)
    case decodingError
    case unknown(Error)
}
