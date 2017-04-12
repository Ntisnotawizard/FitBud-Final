//
//  LoginViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 12/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        
        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
        if(userEmailStored == userEmail){
            if(userPasswordStored == userPassword){
                
                // Login is successful
                UserDefaults.standard.set(true, forKey:"isUserLoggedIn")
                
                UserDefaults.standard.synchronize()
                
                // dismiss login view
                self.dismiss(animated: true, completion:nil)
            }
            
        
        }
        
        // check if email is correct
        
        if(userEmailStored != userEmail)
        {
            // Display alert message
            
            displayMyAlertMessage(userMessage: "This email does not exist")
            
            return
            
        }
        
        // check if password is correct
        
        if(userPasswordStored != userPassword)
        {
            // Display alert message
            
            displayMyAlertMessage(userMessage: "Wrong Password")
            
            return
            
        }
        
    }
    
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:nil)
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
