//
//  LeftSideViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 16/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!

    var usernameLabelText = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = usernameLabelText

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
   
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
