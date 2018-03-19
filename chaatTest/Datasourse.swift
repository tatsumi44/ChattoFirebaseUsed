//
//  Datasourse.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class DataSourse: ChatDataSourceProtocol {
    var delegate: ChatDataSourceDelegateProtocol?
    var controller = ChatItemController()
    init(totalMessages: [ChatItemProtocol]) {
        self.controller.totalMessages = totalMessages
        self.controller.loardIntoItemArray(messageNeeded:min(totalMessages.count, 50) )
    }
    var chatItems: [ChatItemProtocol] {
        
        return controller.chatItems
    }
    
    var hasMoreNext: Bool{
        return false
    }
    var hasMorePrevious: Bool{
        
        return controller.totalMessages.count - controller.chatItems.count > 0 
    }
    
    func loadNext() {
    }
    func loadPrevious(){
        controller.loardPrevious()
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .pagination)
    }
    func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion:(_ didAdjust: Bool) -> Void){
        if focusPosition > 0.9{
             print("need ajust window")
            self.controller.ajustWindow()
             completion(true)
        }else{
            completion(false)
        }
   
    }
    
    func addMessage(message: ChatItemProtocol){
        self.controller.insertItem(message: message)
        self.delegate?.chatDataSourceDidUpdate(self)
    }
    
    
}
