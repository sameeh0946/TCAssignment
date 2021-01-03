//
//  ViewController.swift
//  TCAssignment
//
//  Created by Sameeh Ahmed on 12/30/20.
//  Copyright © 2020 Sameeh Ahmed. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
        

    }
    
    @objc func buttonTapped(){
        scrapeTCBlog()
        print("button click")
    }
    
    func scrapeTCBlog() -> Void {
        AF.request("https://truecaller.blog/2018/03/15/how-to-become-an-ios-developer/").responseString { response in
            //print("check here: \(String(describing: response.value))")
            if let html = response.value {
                self.parseHTML(html: html)
            }
        }
    }

    func parseHTML(html: String) -> Void {
        guard let strippedHtmlString = html.stripOutHtml() else{return}
    
        //3
        let arrayOfRemovedWhitespaces = strippedHtmlString.removingWhitespaces()
        var newRemovedEmptyElements = [String]()
        for elements in arrayOfRemovedWhitespaces {
            if elements.count > 0{
                newRemovedEmptyElements.append(elements)
            }
        }
        print("lastRequest: \(newRemovedEmptyElements.count)")
        
        //2
        let stringOfRemovedWhiteSpaces = strippedHtmlString.removingWhitespacesString()
        var i = 9
        var n10thArrays = [String]()
        while i < stringOfRemovedWhiteSpaces.count {
            n10thArrays.append(stringOfRemovedWhiteSpaces[i])
            i = i + 9
        }
        print("secondArrayTask \(n10thArrays)")
        
        
        //1
        let first10thChar = strippedHtmlString[9]
        print("first10thChar \(first10thChar)")
    }



}

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

