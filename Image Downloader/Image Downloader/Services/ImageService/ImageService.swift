//
//  ImageService.swift
//  Image Downloader
//
//  Created by Gabriel Merenfeld on 22/04/26.
//

import UIKit

final class ImageService {
    static let shared = ImageService()
    
    static private let workerQueue = DispatchQueue(
        label: "ImageService.worker",
        qos: .userInitiated,
        attributes: .concurrent
    )
    
    private init() {}
    
    func download(
        urlString: String,
        completion: @escaping (Result<UIImage, NetworkError>) -> Void
    ) -> URLSessionDataTask? {
        if let cachedImage = ImageCache.shared.get(key: urlString) {
            DispatchQueue.main.async {
                completion(.success(cachedImage))
            }
            return nil
        }
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completion(.failure(.invalidURL(url: urlString)))
            }
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error as? URLError {
                if error.code == .cancelled { return }
            }
            
            guard
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                completion(.failure(.invalidResponse))
                return
            }
            
            workerQueue.async {
                guard
                    let data,
                    let image = UIImage(data: data)
                else {
                    completion(.failure(.noData))
                    return
                }
                
                ImageCache.shared.save(image: image, key: urlString)
                
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            }
        }
        
        task.resume()
        return task
    }
}
