//
//  ViewController.swift
//  TCAssignment
//
//  Created by Sameeh Ahmed on 12/30/20.
//  Copyright © 2020 Sameeh Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        print("button click")
    }


}

