//
//  TextModel.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/15.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Chatto
import ChattoAdditions

class TextModel: TextMessageModel<MessageModel> {
    static let chatItemType = "text"
    
    override init(messageModel: MessageModel, text: String) {
        super.init(messageModel: messageModel, text: text)
    }
}
