//
//  AsyncImageView.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 28.08.2023.
//

import UIKit

class AsyncImageView: UIImageView {
    // MARK: - Data
    var task: URLSessionDataTask!
    static let imageCache = NSCache<NSString, UIImage>()

    // MARK: - Subviews
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        return indicator
    }()

    // MARK: - Methods
    func fetchImage(from url: URL?) {
        image = nil

        guard let url = url else { return }

        addAndStartActivityIndicator()

        if let task = task {
            task.cancel()
        }

        if let imageFromCache = AsyncImageView.imageCache.object(forKey: url.absoluteString as NSString) {
            image = imageFromCache
            stopAndRemoveActivityIndicator()
            return
        }

        task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let newImage = UIImage(data: data)
            else {
                return
            }

            AsyncImageView.imageCache.setObject(newImage, forKey: url.absoluteString as NSString)

            DispatchQueue.main.async {
                self.image = newImage
                self.stopAndRemoveActivityIndicator()
            }
        }
        task.resume()
    }

    // MARK: - Private methods
    private func addAndStartActivityIndicator() {
        addSubview(activityIndicator, useAutoLayout: true)
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.startAnimating()
    }

    private func stopAndRemoveActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}
