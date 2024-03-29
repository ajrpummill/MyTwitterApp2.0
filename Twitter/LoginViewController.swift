//
//  LoginViewController.swift
//  Twitter
//
//  Created by Anthony Pummill on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true
        {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
        }
    }
    
    @IBAction func onLogin(_ sender: Any)
    {
      print("Sup?\nHere are some possible issues below!\n")
        
        let authenticateURL = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: authenticateURL, success:
            {
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                self.performSegue(withIdentifier: "LoginToHome", sender: self)
                
            }, failure: { (Error) in print("Could not log you in")})
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
