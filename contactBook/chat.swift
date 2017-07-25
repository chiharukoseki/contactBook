//
//  chat.swift
//  contactBook
//
//  Created by ryota on 2017/07/12.
//  Copyright © 2017年 小関千晴. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Firebase
import FirebaseDatabase


class chat: JSQMessagesViewController {
    let sendUser = "福本"
    let readerUser = "中西先生"
    let flag = false
    
    
    var messages: [JSQMessage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        senderDisplayName = sendUser
        senderId = sendUser
        
 //--------------------------------------------------------------
        let ref = Database.database().reference()
        ref.child("talks").observe(.value, with: { snapshot in
            guard let dic = snapshot.value as? Dictionary<String, AnyObject> else {
                return
            }
            guard let posts = dic[self.sendUser] as? Dictionary<String, Dictionary<String, AnyObject>> else {
                return
            }
            // guard let masse = posts["福本"] as? Dictionary<String, Dictionary<String, Dictionary<String, AnyObject>>> else{
            //    return
            // }
            
            var keyValueArray: [(String, Int)] = []
            for (key, value) in posts {
                keyValueArray.append((key: key, date: value["date"] as! Int))
            }
            keyValueArray.sort{$0.1 < $1.1}             // タプルの中のdate でソートしてタプルの順番を揃える(配列で) これでkeyが順番通りになる
            // messagesを再構成
            var preMessages = [JSQMessage]()
            
            for sortedTuple in keyValueArray{
                for (key, value) in posts {
                    if key == sortedTuple.0 {           // 揃えた順番通りにメッセージを作成
                        let senderId = value["senderId"] as! String!
                        let text = value["text"] as! String!
                        let displayName = value["displayName"] as! String!
                        preMessages.append(JSQMessage(senderId: senderId, displayName: displayName, text: text))
                    }
                }
            }
            self.messages = preMessages
            
            self.collectionView.reloadData()
        })
    }
            
            
            
            
            
            
            
            
            
            
            
            
//            self.messages = posts.values.map {dic  in
//                let senderId = dic["senderId"] ?? "" as AnyObject
//                let text = dic["text"] ?? "" as AnyObject
//                let displayName = dic["displayName"] ?? "" as AnyObject
//                print(senderId,displayName)
//                return JSQMessage(senderId: senderId as! String,  displayName: displayName as! String, text: text as! String)
//            }
//            self.collectionView.reloadData()
//        }
//        )
//----------------------------------------------------------------この辺おかしいあるよ　わかってるけど降りれないのよ・・・・
//    }

    
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.row]
    }
    
    // コメントの背景色の指定
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        if messages[indexPath.row].senderId == senderId {
            return JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImage(with: UIColor(red: 112/255, green: 192/255, blue:  75/255, alpha: 1))
        } else {
            return JSQMessagesBubbleImageFactory().incomingMessagesBubbleImage(with: UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1))
        }
    }
    
    // コメントの文字色の指定
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        if messages[indexPath.row].senderId == senderId {
            cell.textView.textColor = UIColor.white
        } else {
            cell.textView.textColor = UIColor.darkGray
        }
        return cell
    }
    
    // メッセージの数
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    // ユーザのアバターの設定
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return JSQMessagesAvatarImageFactory.avatarImage(
            withUserInitials: messages[indexPath.row].senderDisplayName,
            backgroundColor: UIColor.lightGray,
            textColor: UIColor.white,
            font: UIFont.systemFont(ofSize: 10),
            diameter: 30)
    }
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        inputToolbar.contentView.textView.text = ""
        let ref = Database.database().reference()
        ref.child("talks").child(senderId).childByAutoId().setValue(["name":senderDisplayName,"text": text,"senderId":senderId,"date": [".sv": "timestamp"]])
        //ref.child("talks").childByAutoId().setValue(["senderId": senderId, "text": text, "displayName": senderDisplayName])
    }
    
}
