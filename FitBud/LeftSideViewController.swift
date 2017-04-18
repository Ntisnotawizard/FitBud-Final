//
//  LeftSideViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 16/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // populate the menu 
    
    var profileItems:[String] = ["Settings", "Edit Profile", "Update Status", "About", "Logout"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return profileItems.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        let mycell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCustomTableViewCell
        
        mycell.profileItemLabel.text = profileItems[indexPath.row]
        
        return mycell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        <#code#>
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
