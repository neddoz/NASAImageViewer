//
//  APIClient.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

final class APIClient {
    static let shared = APIClient()

    func send<T: Codable>(apiRequest: APIRequest) -> Observable<Result<T, Error>> {
        let request = apiRequest.request(with: baseURL)
        return URLSession.shared.rx.response(request: request).map {
            if $0.response.status != .success {
                if $0.response.status == .notFound {
                    return .failure(NetworkError.NotFound(errorMessage: request.url?.absoluteString ?? ""))
                } else {
                    return .failure(NetworkError.other)
                }
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(Formatter.iso8601)
                return .success(try decoder.decode(T.self, from: $0.data))
            } catch {
                return .failure(NetworkError.DecodingFailure(errorMessage: error.localizedDescription))
            }
        }.share(replay: 1, scope: SubjectLifetimeScope.forever)
    }
    
    // MARK: - Private methods

    private let baseURL = URL(string: "https://images-api.nasa.gov/")!
}
