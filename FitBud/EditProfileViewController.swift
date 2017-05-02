//
//  EditProfileViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 18/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit
import Firebase

class EditProfileViewController: UIViewController {

   
    @IBOutlet weak var profilePictureImageView: UIImageView!
    
    @IBOutlet weak var usernameTextField: UITextField!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func doneButtonTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    
    @IBAction func chooseProfileButtonTap(_ sender: Any) {
    }
    
    
}
