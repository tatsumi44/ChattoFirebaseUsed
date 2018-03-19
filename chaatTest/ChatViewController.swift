//
//  ChatViewController.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/15.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import  Chatto
import ChattoAdditions
class ChatViewController: BaseChatViewController {
    //inputbar表示に必要
    var presenter: BasicChatInputBarPresenter!
    var dataSourse: DataSourse!
    var decorator = Decorator()
    var totalMessages = [ChatItemProtocol]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...295{
            let message = MessageModel(uid: "\(i)", senderId: "", type: TextModel.chatItemType, isIncoming: false, date: Date(), status: .success)
            totalMessages.append(TextModel(messageModel: message, text: "\(i)"))
        }
        
        
        self.dataSourse = DataSourse(totalMessages : self.totalMessages)
        self.chatDataSource =  self.dataSourse
        self.chatItemsDecorator = self.decorator
        self.constants.preferredMaxMessageCount = 300
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //プロトコルエラーの修正
    override func createPresenterBuilders() -> [ChatItemType : [ChatItemPresenterBuilderProtocol]] {
        let textMessageBuilder = TextMessagePresenterBuilder(viewModelBuilder: TextBuilder(), interactionHandler: TextHandler())
        let photoPresnterBuilder = PhotoMessagePresenterBuilder(viewModelBuilder: PhotoBuilder(), interactionHandler: PhotoHandler() )
         return [TextModel.chatItemType : [textMessageBuilder],PhotoModel.chatItemType: [photoPresnterBuilder]]
        
    }
    //inputbarの内容
    override func createChatInputView() -> UIView {
        let inputbar = ChatInputBar.loadNib()
        var appearance = ChatInputBarAppearance()
        appearance.sendButtonAppearance.title = "send"
        appearance.textInputAppearance.placeholderText = "Type a message"
        self.presenter = BasicChatInputBarPresenter(chatInputBar: inputbar, chatInputItems: [handlSend(), hundlephoto()], chatInputBarAppearance: appearance )
        return inputbar
    }
    
    func handlSend() -> TextChatInputItem {
        let item = TextChatInputItem()
        item.textInputHandler = { text in
            
            print(text)
            let date = Date()
            let double = Double(date.timeIntervalSinceReferenceDate)
            let senderID = "me"
            
            let message = MessageModel(uid: "\(double, senderID)", senderId: senderID, type: TextModel.chatItemType, isIncoming: false, date: Date(), status: .success)
            //modelを必ず呼ばなければならない
            let textMessage = TextModel(messageModel: message, text: text)
            self.dataSourse.addMessage(message: textMessage)
        }
        return item
    }
    
    func hundlephoto() -> PhotosChatInputItem  {
        let item = PhotosChatInputItem(presentingController: self)
        item.photoInputHandler = { photo in
            print(photo)
            let date = Date()
            let double = Double(date.timeIntervalSinceReferenceDate)
            let senderID = "me"
            
            let message = MessageModel(uid: "\(double, senderID)", senderId: senderID, type: PhotoModel.chatItemType, isIncoming: false, date: Date(), status: .success)
            let photoMessage = PhotoModel(messageModel: message, imageSize: photo.size, image: photo )
            self.dataSourse.addMessage(message: photoMessage)
            
        }
        return item
        
    }

}
