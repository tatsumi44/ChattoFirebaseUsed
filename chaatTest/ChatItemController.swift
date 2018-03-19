//
//  chatItemController.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

 class ChatItemController{

    var chatItems = [ChatItemProtocol]()
    var totalMessages  = [ChatItemProtocol]()
   
    
    func loardIntoItemArray(messageNeeded: Int) {
        

        for index in stride(from: totalMessages.count - chatItems.count, to: totalMessages.count - chatItems.count - messageNeeded, by: -1) {
            print(totalMessages[index - 1])
            self.chatItems.insert(totalMessages[index - 1], at: 0)

        }
    }
     
    func  insertItem(message: ChatItemProtocol) {
        self.chatItems.append(message)
        self.totalMessages.append(message)
    }
    
    func loardPrevious() {
        self.loardIntoItemArray(messageNeeded: min(totalMessages.count - chatItems.count, 25))
    }
    func ajustWindow() {
        self.chatItems.removeFirst(200)
    }
}

