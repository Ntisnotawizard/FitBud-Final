//
//  ViewController.swift
//  FitBud
//
//  Created by TheGrandWizard on 12/04/2017.
//  Copyright © 2017 TheGrandWizard. All rights reserved.
//

import UIKit
import Firebase

enum Section: Int {
    case createNewChannelSection = 0
    case currentChannelsSection
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var senderDisplayName: String?     // store sender name
    var newChannelTextField: UITextField?
    private var channels: [Channel] = []
    private lazy var channelRef: FIRDatabaseReference = FIRDatabase.database().reference().child("channels")
    private var channelRefHandle: FIRDatabaseHandle?
    
    
    private func observeChannels() {
        // listen to new channels being written to the firebase database
        channelRefHandle = channelRef.observe(.childAdded, with: { (snapshot) -> Void in 
            let channelData = snapshot.value as! Dictionary<String, AnyObject>
            let id = snapshot.key
            if let name = channelData["name"] as! String!, name.characters.count > 0 {
                self.channels.append(Channel(id: id, name: name))
                self.tableView.reloadData()
            } else {
                print("Error! Could not decode channel data")
            }
        })
    }
    
    // Set number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Set number of rows for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currentSection: Section = Section(rawValue: section) {
            switch currentSection {
            case .createNewChannelSection:
                return 1
            case .currentChannelsSection:
                return channels.count
            }
        } else {
            return 0
        }
    }
    
    // Populate cell content
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = (indexPath as NSIndexPath).section == Section.createNewChannelSection.rawValue ? "NewChannel" : "ExistingChannel"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if (indexPath as NSIndexPath).section == Section.createNewChannelSection.rawValue {
            
            if let createNewChannelCell = cell as? CreateChannelCell {
                
                newChannelTextField = createNewChannelCell.newChannelNameField
                
            }
        } else if (indexPath as NSIndexPath).section == Section.currentChannelsSection.rawValue {
            cell.textLabel?.text = channels[(indexPath as NSIndexPath).row].name
        }
        
        return cell
    }
    
    // MARK: UITableViewDelegate
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == Section.currentChannelsSection.rawValue {
            let channel = channels[(indexPath as NSIndexPath).row]
            self.performSegue(withIdentifier: "ShowChannel", sender: channel)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Activity Channels"
        observeChannels()
    }
    
    deinit {
        if let refHandle = channelRefHandle {
            channelRef.removeObserver(withHandle: refHandle)
        }
    }
    
    // create channel and save to list
    @IBAction func createChannel(_ sender: AnyObject) {
        if let name = newChannelTextField?.text {
            let newChannelRef = channelRef.childByAutoId()
            let channelItem = [
                "name": name
            ]
            newChannelRef.setValue(channelItem)
        }
    }
    
    // set initial values for senderID and senderDisplayName    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let channel = sender as? Channel {
            let chatVc = segue.destination as! ChatViewController
            
            chatVc.senderDisplayName = senderDisplayName
            chatVc.channel = channel
            chatVc.channelRef = channelRef.child(channel.id)
        }
    }
    
}

