//
//  UserService.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

import Foundation

final class UserService {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    static func fetchUsers(completion: @escaping (Result<UserList, ErrorHandler>) -> Void) {
        let urlString = "\(baseURL)/users"
        
        guard let url = URL(string: urlString) else {
            let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                let error = ErrorHandler(message: "Erro ao realizar a requisição: \(error.localizedDescription)", statusCode: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                let error = ErrorHandler(message: "Resposta inválida", statusCode: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                let error = ErrorHandler(message: "Erro ao realizar a requisição.\nSTATUS CODE: \(httpResponse.statusCode)", statusCode: httpResponse.statusCode)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            guard let data else {
                let error = ErrorHandler(message: "Nenhum dado foi retornado da requisição", statusCode: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            do {
                let users = try JSONDecoder().decode(UserList.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(users))
                }
            } catch {
                let error = ErrorHandler(message: "Error ao processar dados recebidos: \(error.localizedDescription)", statusCode: nil)
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
