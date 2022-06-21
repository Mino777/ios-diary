//
//  UIViewController.swift
//  Diary
//
//  Created by mmim, grumpy, mino on 2022/06/21.
//

import UIKit

extension UIViewController {
    func showAlert(handler: @escaping ((UIAlertAction) -> Void)) {
        let alert = UIAlertController(
            title: AppConstants.deleteAlertTitle,
            message: AppConstants.deleteAlertMessage,
            preferredStyle: .alert
        )
        let cancelAction = UIAlertAction(title: AppConstants.cancelActionTitle, style: .cancel)
        let removeAction = UIAlertAction(title: AppConstants.deleteActionTitle, style: .destructive, handler: handler)
        alert.addAction(cancelAction)
        alert.addAction(removeAction)
        present(alert, animated: true)
    }
}
