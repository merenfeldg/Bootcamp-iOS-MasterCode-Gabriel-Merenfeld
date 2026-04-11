//
//  PostsService.swift
//  Networking Ex1
//
//  Created by Gabriel Merenfeld on 11/04/26.
//

import Foundation

final class PostsService {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    
    static func fetchAllPosts(completion: @escaping (Result<PostList, ErrorHandler>) -> Void) {
        let urlString = "\(baseURL)/posts"
        
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
                let posts = try JSONDecoder().decode(PostList.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(posts))
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
    
    static func fetchPostById(_ id: Int, completion: @escaping (Result<PostModel, ErrorHandler>) -> Void) {
        let urlString = "\(baseURL)/posts/\(id)"
        
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
                let post = try JSONDecoder().decode(PostModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(post))
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
    
    static func createPost(_ newPost: PostModel, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
        let urlString = "\(baseURL)/posts"
        
        guard let url = URL(string: urlString) else {
            let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }
        
        guard let dataBody = try? JSONEncoder().encode(newPost) else {
            let error = ErrorHandler(message: "Erro ao serializar o JSON", statusCode: nil)
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = dataBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
            
            DispatchQueue.main.async {
                completion(.success(()))
            }
        }
        task.resume()
    }
    
    static func replacePost(post: PostModel, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
        let urlString = "\(baseURL)/posts/\(post.id)"
        
        guard let url = URL(string: urlString) else {
            let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }
        
        guard let dataBody = try? JSONEncoder().encode(post) else {
            let error = ErrorHandler(message: "Erro ao serializar o JSON", statusCode: nil)
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = dataBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
            
            DispatchQueue.main.async {
                completion(.success(()))
            }
        }
        task.resume()
    }
    
    static func deletePostById(_ id: Int, completion: @escaping (Result<Void, ErrorHandler>) -> Void) {
        let urlString = "\(baseURL)/posts/\(id)"
        
        guard let url = URL(string: urlString) else {
            let error = ErrorHandler(message: "Erro ao criar a URL", statusCode: nil)
            DispatchQueue.main.async {
                completion(.failure(error))
            }
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
            
            DispatchQueue.main.async {
                completion(.success(()))
            }
        }
        task.resume()
    }
}
