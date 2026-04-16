//
//  APIClient.swift
//  Networking Ex2
//
//  Created by Gabriel Merenfeld on 16/04/26.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    
    let baseURL: String
    let session: URLSession
    let timeout: TimeInterval
    let requestBuilder: GlobalRequestProtocol
    
    init(
        baseURL: String? = nil,
        session: URLSession = URLSession.shared,
        timeout: TimeInterval = 6,
        requestBuilder: GlobalRequestProtocol = DefaultRequest()
    ) {
        self.session = session
        self.timeout = timeout
        self.requestBuilder = requestBuilder
        
        if let baseURL {
            self.baseURL = baseURL
        }
        else {
            guard
                let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String
            else {
                fatalError("BaseURL não encontrada no arquivo: info.plist")
            }
            
            self.baseURL = baseURL
        }
    }
    
    func request(
        request: APIRequest,
        completion: @escaping (Result<Void, NetworkError>) -> Void
    ) {
        execute(request: request) { result in
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
        request: APIRequest,
        decodeType: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        execute(request: request) { result in
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
    
    private func execute(
        request: APIRequest,
        completion: @escaping (Result<Data?, NetworkError>) -> Void
    ) {
        guard let requestCompleted = requestBuilder.request(
            apiResquest: request,
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
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(.statusCode(code: httpResponse.statusCode)))
                 return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
