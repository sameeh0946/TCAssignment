//
//  ViewController.swift
//  TCAssignment
//
//  Created by Sameeh Ahmed on 12/30/20.
//  Copyright © 2020 Sameeh Ahmed. All rights reserved.
//

import UIKit
import Alamofire
//import Kanna

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
        print("parseHTML called")
        let str = html.stripOutHtml()
        //let str = html.withoutHtmlTags()
        // Finish this next
        print("str: \(String(describing: str))")
    }



}

extension String {

    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}
