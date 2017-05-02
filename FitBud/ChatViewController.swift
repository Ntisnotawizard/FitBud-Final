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
    
    var messages = [JSQMessage]() // store various instances of jsqmessages
    
    // create outgoing and incoming message bubbles
    
    //lazy var outgoingBubbleImageView: JSQMessagesBubbleImage = self.setupOutgoingBubble()
    //lazy var incomingBubbleImageView: JSQMessagesBubbleImage = self.setupIncomingBubble()
    
    private lazy var messageRef: FIRDatabaseReference = self.channelRef!.child("messages")
    private var newMessageRefHandle: FIRDatabaseHandle?
 
    var channelRef: FIRDatabaseReference?
    var channel: Channel? {
        didSet {
            title = channel?.name
        }
    }
    
    // create new jsqmessage and save it to the data source
    private func addMessage(withId id: String, name: String, text: String) {
        if let message = JSQMessage(senderId: id, displayName: name, text: text) {
            messages.append(message)
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count // return number of messages in each section
    }
    /*
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item] // retrieve message
        if message.senderId == senderId { // check user status to return either outgoing or incoming image
            return outgoingBubbleImageView
        } else { // return incoming image view
            return incomingBubbleImageView
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // No avatars
        //collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        //collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        
        // This sets the senderId based on the logged in Firebase user.

        self.senderId = FIRAuth.auth()?.currentUser?.uid
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func viewDidAppear(_ animated: Bool) {
        /*
        // messages from someone else
        addMessage(withId: "Dft", name: "Mr. crippling", text: "depression!")
        // messages sent from local sender
        addMessage(withId: senderId, name: "Me", text: "Idgaf pure gym girls doe!")
        addMessage(withId: senderId, name: "Me", text: "I like that!")
        // animates the receiving of a new message on the view
        finishReceivingMessage()*/
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
