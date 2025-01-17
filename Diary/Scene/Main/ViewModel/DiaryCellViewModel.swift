//
//  DiaryCellViewModel.swift
//  Diary
//
//  Created by mmim, grumpy, mino on 2022/06/28.
//

import UIKit

final class DiaryCellViewModel {
    private let imageDownloader = ImageDownloader()
    let image: ColdObservable<UIImage> = .init()
    
    func prepareForReuse() {
        imageDownloader.cancelTask()
    }
    
    func setUpContents(icon: String) {
        requestImage(icon: icon)
    }
    
    private func requestImage(icon: String) {
        imageDownloader.requestImage(icon: icon) { [weak self] result in
            self?.image.onNext(value: result)
        }
    }
}
