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
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondTextView: UITextView!
    @IBOutlet weak var thirdLabel: UILabel!
    
    @IBOutlet weak var taskButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        taskButton.loadingIndicator(show: false)
        button.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
    
    }
    
    @objc func buttonTapped(){
        scrapeTCBlog()
        print("button click")
        taskButton.loadingIndicator(show: true)
    }
    
    func scrapeTCBlog() -> Void {
        AF.request(Constants.blogUrl).responseString { response in
            //print("check here: \(String(describing: response.value))")

            guard let html = response.value else {
                DispatchQueue.main.async {
                    print("\(Error.self)")
                    self.showAlert()
                }
                
                return }
                self.parseHTML(html: html)
            }

        }
    

    func parseHTML(html: String) -> Void {
        
        guard let strippedHtmlString = html.stripOutHtml() else{return}
        self.taskButton.loadingIndicator(show: false)
        //Task 3
        let arrayOfRemovedWhitespaces = strippedHtmlString.removingWhitespaces()
        var newRemovedEmptyElements = [String]()
        for elements in arrayOfRemovedWhitespaces {
            if elements.count > 0{
                newRemovedEmptyElements.append(elements)
            }
        }
        print("lastRequest: \(newRemovedEmptyElements.count)")
        thirdLabel.text = String(newRemovedEmptyElements.count)
        
        //2
        let stringOfRemovedWhiteSpaces = strippedHtmlString.removingWhitespacesString()
        var i = 9
        var n10thArrays = [String]()
        while i < stringOfRemovedWhiteSpaces.count {
            n10thArrays.append(stringOfRemovedWhiteSpaces[i])
            i = i + 9
        }
        print("secondArrayTask \(n10thArrays)")
        
        //Converting to comma separetd string
        secondTextView.text = n10thArrays.joined(separator:",")
        
        //1
        let first10thChar = strippedHtmlString[9]
        print("first10thChar \(first10thChar)")
        firstLabel.text = first10thChar
    }



}
