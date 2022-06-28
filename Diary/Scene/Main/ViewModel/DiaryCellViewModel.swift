//
//  DiaryCellViewModel.swift
//  Diary
//
//  Created by mmim, grumpy, mino on 2022/06/28.
//

import Foundation
import UIKit

final class DiaryCellViewModel {
    private(set) var task: URLSessionDataTask?
    private let networkManager = NetworkManager()
    private(set) var image = Observable(UIImage())
    
    func prepareForReuse() {
        task?.suspend()
        task?.cancel()
    }
    
    func setUpContents(icon: String) {
        requestImage(icon: icon)
    }
    
    private func requestImage(icon: String) {
        if let cacheImage = ImageCacheManager.shared.retrive(forKey: icon) {
            image.value = cacheImage
            return
        }
        
        let endpoint = EndpointStorage
            .weatherIcon(icon)
            .endPoint
        
        task = networkManager.requestImageAPI(with: endpoint) { [weak self] (result: Result<UIImage, Error>) in
            switch result {
            case .success(let image):
                ImageCacheManager.shared.set(object: image, forKey: icon)
                self?.image.value = image
            case .failure:
                guard let image = UIImage(systemName: "questionmark.square.dashed") else {
                    return
                }
                self?.image.value = image
            }
        }
    }
}
