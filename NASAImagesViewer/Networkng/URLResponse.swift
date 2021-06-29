//
//  URLResponse.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 28/06/2021.
//

import Foundation

extension URLResponse{

    public enum HTTPStatus{
        public enum description{
            case success
            case created
            case badRequest
            case unauthorized
            case forbidden
            case notFound
            case conflict
            case serverError
            case other
        }
        
        case code(Int)
        
        var status: description{
            switch self{
            case .code(200...299):
                return .success
            case .code(400):
                return .badRequest
            case .code(401):
                return .unauthorized
            case .code(403):
                return .forbidden
            case .code(404):
                return .notFound
            case .code(409):
                return .conflict
            case .code(500...599):
                return .serverError
            default:
                return .other
            }
        }
    }
    
    var status: HTTPStatus.description {
        let response = self as? HTTPURLResponse ?? HTTPURLResponse()
        
        let statusCode = HTTPStatus.code(response.statusCode).status
        return statusCode
    }
    
}

public enum NetworkError: Error {
    case DecodingFailure(errorMessage: String)
    case BadRequest(errorMessage: String)
    case Unauthorized
    case NotFound(errorMessage: String)
    case other
    
    init(response: URLResponse, message: String) {
        switch response.status {
        case .badRequest:
            self = .BadRequest(errorMessage: message)
        case .notFound:
            self = .BadRequest(errorMessage: message)
        case .unauthorized:
            self = .Unauthorized
        default:
            self = .other
        }
    }
    
    func errorMessage()-> String {
        switch self {
        case .BadRequest(let message):
            return message
        case .NotFound(let message):
            return message
        case .DecodingFailure(let message):
            return message
        case .Unauthorized:
            return "Unauthorized"
        default:
            return "UnKnown"
        }
    }
}
