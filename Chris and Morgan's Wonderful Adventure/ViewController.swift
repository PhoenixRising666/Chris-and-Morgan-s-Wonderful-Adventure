//
//  ViewController.swift
//  Chris and Morgan's Wonderful Adventure
//
//  Created by Morgan Lemke on 11/2/17.
//  Copyright © 2017 LivePerson. All rights reserved.
//

import UIKit
import JWT

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        JWT.encode(claims: ["my": "payload"], algorithm: .hs256("secret".data(using: .utf8)!))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

