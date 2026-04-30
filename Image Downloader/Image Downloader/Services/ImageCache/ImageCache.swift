//
//  ImageCache.swift
//  Image Downloader
//
//  Created by Gabriel Merenfeld on 22/04/26.
//

import Foundation
import UIKit

final class ImageCache {
    static let shared = ImageCache()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func get(key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func save(image: UIImage, key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func remove(key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
}
