//
//  ViewController.swift
//  Chris and Morgan's Wonderful Adventure
//
//  Created by Morgan Lemke on 11/2/17.
//  Copyright © 2017 LivePerson. All rights reserved.
//

import UIKit
import JWT
import Starscream

class ViewController: UIViewController {
    
    @IBOutlet weak var conversationText: UITextView!
    @IBOutlet weak var textIN: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //can't edit by user
        conversationText.isEditable=false
        //stops field from being overriden
        conversationText.clearsOnInsertion=false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //Get the JWT
        var c = ClaimSet();
        c.issuer = "https://liveperson.com";
        c.issuedAt = Date();
        //TODO - add expiration for GA c.expiration = Date();
        c["sub"] = NSUUID().uuidString;
        c["lp_sdes"] = [ ];
        let jwt = JWT.encode(claims: c, algorithm: .hs256("secret".data(using: .utf8)!));
        
        //Conect to LP
        let serviceName = "asyncMessagingEnt";
        let getDomainURL = "https://adminlogin.liveperson.net/csdr/account/77881384/service/" + serviceName + "/baseURI.lpCsds?version=1.0";
        guard  let url = URL(string: getDomainURL) else {
            print("Error can't create url");
            return
        }
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared;
        
        session.dataTask(with: URLRequest) { (data, response, error,?) in
            print(data)
                        if(error){
                            print(error)
                     }
        }
        //task.resume()
   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

