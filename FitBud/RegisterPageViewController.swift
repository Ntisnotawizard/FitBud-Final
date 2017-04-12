//
//  RegisterPageViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 12/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonTap(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        
        
        // check for empty fields
        
        if((userEmail?.isEmpty)! || (userPassword?.isEmpty)! || ((userRepeatPassword) == nil)){
         
            // display alert message
            
            displayMyAlertMessage(userMessage: "All fields are required")
            
            return
        }
        
        // check if passwords match
        
        if(userPassword != userRepeatPassword)
        {
            // Display alert message
            
            displayMyAlertMessage(userMessage: "Passwords do not match")
            
            return

        }
        
        // Store data
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        
        
        UserDefaults.standard.set(userEmail, forKey: "userPassword")
        
        
        UserDefaults.standard.synchronize()
        
        // display confirmation message
        
        let myAlert = UIAlertController(title:"Alert", message: "Registration Successful", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"OK", style: UIAlertActionStyle.default){
            action in self.dismiss(animated: true, completion:nil)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
        
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
