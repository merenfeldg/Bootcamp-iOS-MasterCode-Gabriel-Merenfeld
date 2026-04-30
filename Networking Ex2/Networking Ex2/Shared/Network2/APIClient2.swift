//
//  APIClient.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 19/04/26.
//

import Foundation

final class APIClient2 {
    static let shared = APIClient()
    
    let baseURL: String
    let timeout: TimeInterval
    let requestBuilder: GlobalRequestProtocol2
    let session: URLSession
    
    init(
        url: String? = nil,
        timeout: TimeInterval = 6,
        requestBuilder: GlobalRequestProtocol2 = DefaultRequest2(),
        session: URLSession = URLSession.shared
    ) {
        self.timeout = timeout
        self.requestBuilder = requestBuilder
        self.session = session
        
        if let url {
            self.baseURL = url
        } else {
            guard
                let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String
            else {
                fatalError("BaseURL não encontrada no arquivo: info.plist!")
            }
            
            self.baseURL = baseURL
        }
    }
    
    func request(
        request: APIRequest2,
        completion: @escaping (Result<Void, NetworkError2>) -> Void
    ) {
        executeRequest(request) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success:
                        completion(.success(()))
                    
                    case .failure(let failure):
                            completion(.failure(failure))
                }
            }
        }
    }
    
    func request<T: Decodable>(
        request: APIRequest2,
        decodeType: T.Type,
        completion: @escaping (Result<T, NetworkError2>) -> Void
    ) {
        executeRequest(request) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let data else {
                        completion(.failure(.noData))
                        return
                    }
                    
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(.decodingError(error)))
                    }
                    
                case .failure(let failure):
                    completion(.failure(failure))
                }
            }
        }
    }
    
    private func executeRequest(
        _ request: APIRequest2,
        completion: @escaping (Result<Data?, NetworkError2>) -> Void
    ) {
        guard let requestCompleted = requestBuilder.request(
            apiRequest: request,
            baseURL: baseURL,
            timeout: timeout
        ) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = session.dataTask(with: requestCompleted) { data, response, error in
            if let error {
                completion(.failure(.networkFailure(error)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(.statusCode(code: response.statusCode)))
                return
            }
            
            guard let data else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
