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
        
        //Network request to fetch the content using AlamoFire
        
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
        
        self.taskButton.loadingIndicator(show: false)
        // Task 3 Availaing the count of words
        let arrayOfRemovedWhitespaces = html.removingWhitespaces()
        var newRemovedEmptyElements = [String]()
        //print("arrayOfRemovedWhitespaces : \(arrayOfRemovedWhitespaces)")
        for elements in arrayOfRemovedWhitespaces {
            if elements.count > 0{
                newRemovedEmptyElements.append(elements)
            }
        }
        
        print("lastRequest: \(newRemovedEmptyElements.count)")
            self.thirdLabel.text = String(newRemovedEmptyElements.count)
        
        
        // Task 2 getting every 10th character
        let stringOfRemovedWhiteSpaces = html.removingWhitespacesString()
        print("stringOfRemovedWhiteSpaces \(stringOfRemovedWhiteSpaces)")
        var i = 9
        var n10thArrays = [String]()
        repeat {
            n10thArrays.append(stringOfRemovedWhiteSpaces[i])
            i = i + 9
        } while (i < stringOfRemovedWhiteSpaces.count )
        //Converting to comma separetd string to display in a scroll view
        secondTextView.text = n10thArrays.joined(separator:", ")
        
        //Task 1 getting the 10th element
        let first10thChar = stringOfRemovedWhiteSpaces[9]
        print("first10thChar \(first10thChar)")
        firstLabel.text = first10thChar
    }
    
}

