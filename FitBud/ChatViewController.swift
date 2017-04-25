//
//  ChatViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 25/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit
import Firebase
import JSQMessagesViewController

class ChatViewController: JSQMessagesViewController{
    
    
    var channelRef: FIRDatabaseReference?
    var channel: Channel? {
        didSet {
            title = channel?.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This sets the senderId based on the logged in Firebase user.

        self.senderId = FIRAuth.auth()?.currentUser?.uid
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

}
