//
//  UIImageView+Extension.swift
//  Image Downloader
//
//  Created by Gabriel Merenfeld on 22/04/26.
//

import UIKit

private var imageTaskKey: Int = 0
private var imageURLKey: Int = 0
private var loadingIndicatorKey = 0

extension UIImageView {
    private var imageTask: URLSessionTask? {
        get {
            objc_getAssociatedObject(self, &imageTaskKey) as? URLSessionTask
        }
        set {
            objc_setAssociatedObject(self, &imageTaskKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var imageURL: String? {
        get {
            objc_getAssociatedObject(self, &imageURLKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &imageURLKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    private var loadingIndicator: UIActivityIndicatorView {
        if let loading = objc_getAssociatedObject(self, &loadingIndicatorKey) as? UIActivityIndicatorView {
            return loading
        }
        
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        return indicator
    }
    
    func downloadImage(
        urlString: String,
        showLoading: Bool = true,
        placeholderImage: UIImage? = nil,
        errorImage: UIImage? = nil
    ) {
        cancelImageLoad()
        
        image = placeholderImage
        imageURL = urlString
        if showLoading {
            loadingIndicator.startAnimating()
        }
        
        imageTask = ImageService.shared.download(urlString: urlString) { [weak self] result in
            guard let self else { return }
            
            guard imageURL == urlString else { return }
            loadingIndicator.stopAnimating()
            
            switch result {
                case .success(let image):
                    self.image = image
                
                case .failure:
                    self.image = errorImage
            }
        }
    }
    
    func cancelImageLoad() {
        imageTask?.cancel()
        
        imageTask = nil
        imageURL = nil
        
        loadingIndicator.stopAnimating()
    }
}
