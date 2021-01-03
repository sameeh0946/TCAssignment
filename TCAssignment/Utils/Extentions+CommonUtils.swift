//
//  Extentions.swift
//  TCAssignment
//
//  Created by www.abcom.in on 04/01/21.
//  Copyright © 2021 Sameeh Ahmed. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
    
    func removingWhitespaces() -> [String] {
        return components(separatedBy: .whitespacesAndNewlines)
    }
    
    func removingWhitespacesString() -> String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
    
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
    
}


extension UIButton {
    func loadingIndicator(show: Bool) {
        if show {
            print("Utils showloadingIndicator")
            
            let indicator = UIActivityIndicatorView()
            let buttonHeight = self.bounds.size.height
            let buttonWidth = self.bounds.size.width
            indicator.center = CGPoint(x: buttonWidth-20, y: buttonHeight/2)
            self.addSubview(indicator)
            indicator.startAnimating()
        } else {
            for view in self.subviews {
                print("Utils showfalse loadingIndicator")
                if let indicator = view as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                }
            }
        }
    }
}

extension UIViewController {
    func showAlert(title: String = Constants.titleMessage,
                   message: String = Constants.descMessage ,
                   buttonTitle: String = Constants.okMessage,
                   buttonHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: Constants.tryMessage,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle,
                                   style: .default,
                                   handler: buttonHandler)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}


class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        layer.cornerRadius   = 8
    }
    
}

