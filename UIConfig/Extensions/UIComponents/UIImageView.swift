//
//  UIImageView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 19/12/22.
//

import UIKit

public extension UIImageView {
    convenience init(name: String, isSystem: Bool = true, size: CGFloat = 0, tint: UIColor = .textColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        if isSystem {
            let image: UIImage? = UIImage.system(named: name, size: size)
            self.image = image
        } else {
            self.image = UIImage(named: name)
        }
        self.tintColor = tint
    }
    
    convenience init(icon: Icon, tint: UIColor = .textColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = icon.image
        self.tintColor = tint
    }
    
    /// Cache for the downloaded images.
    var imageCache: NSCache<AnyObject, UIImage> {
        ImageCache.shared.cache
    }

    /// Searches in cache or retrieves from the specified URL an image and assigns it to the receiver.
    ///
    /// - Parameters:
    ///     - urlString: The URL string where download the image from. If `nil` this method does nothing.
    ///     - renderingMode: The rendering mode to use for the new image. Default is `.automatic`.
    func cacheImage(urlString: String?, renderingMode: UIImage.RenderingMode = .automatic) {
        guard let urlString = urlString else { return }

        image = nil

        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) {
            image = imageFromCache.withRenderingMode(renderingMode)
        } else if let url = URL(string: urlString) {
            ImageCache.shared.addDownloadURL(urlString, key: hash)

            DispatchQueue.global(qos: .utility).async {
                URLSession(configuration: .ephemeral).dataTask(with: url) { data, response, error in

                    if let _ = error {
                    } else if let data = data, let imageToCache = UIImage(data: data) {
                        self.imageCache.setObject(imageToCache, forKey: urlString as AnyObject, cost: data.count)

                        if let cachedURLString = ImageCache.shared.downloadURLs[self.hash], cachedURLString == urlString {
                            ImageCache.shared.removeDownloadURL(forKey: self.hash)
                            DispatchQueue.main.async {
                                self.image = self.imageCache.object(forKey: urlString as AnyObject)
                            }
                        }
                    }
                }.resume()
            }
        }
    }
}

class ImageCache {

    static let shared: ImageCache = ImageCache()

    private init () {}

    /// Cache for the downloaded images.
    let cache = NSCache<AnyObject, UIImage>()

    /// Specific queue to work with the `downloadURLs` variable.
    private let safeThreadQueue = DispatchQueue(label: "com.uiConfig.imageCache", qos: .utility, autoreleaseFrequency: .workItem)
    /// Unsafe-thraed variable. Call safe-thread `downloadURLs` variable instead.
    private var unsafeDownloadURLs: [Int : String] = [:]

    /// Safe-thread variable to obtain an URL string from dictionary.
    var downloadURLs: [Int : String] {
        var urls: [Int : String] = [:]
        safeThreadQueue.sync {
            urls = unsafeDownloadURLs
        }
        return urls
    }

    /// Adds an URL string in safe-thread manner to the dictionary.
    func addDownloadURL(_ url: String, key: Int) {
        safeThreadQueue.sync {
            unsafeDownloadURLs[key] = url
        }
    }

    /// Removes an URL string in safe-thread manner from the dictionary.
    func removeDownloadURL(forKey key: Int) {
        safeThreadQueue.sync {
            let _ = unsafeDownloadURLs.removeValue(forKey: key)
        }
    }
}
