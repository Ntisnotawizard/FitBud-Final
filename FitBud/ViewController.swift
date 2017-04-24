//
//  ViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 12/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

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
 
    }

    
    // enable logout
    
    @IBAction func logoutButtonTap(_ sender: Any) {
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginView") as! LoginViewController
                
                present(vc, animated: true, completion: nil)
               
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
       
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
}

