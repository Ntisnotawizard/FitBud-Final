//
//  ViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 12/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if(!isUserLoggedIn)
        {
        self.performSegue(withIdentifier: "loginView", sender: self)
        }
        
    }

    
    // enable logout
    
    @IBAction func logoutButtonTap(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggdIn")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginView", sender: self)

        
    }
    

}

