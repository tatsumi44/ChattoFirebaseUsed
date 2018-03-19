//
//  TextBuilder.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions


class ViewModel: TextMessageViewModel <TextModel> {
    override init(textMessage : TextModel, messageViewModel: MessageViewModelProtocol){
        super.init(textMessage: textMessage, messageViewModel: messageViewModel)
    }
    
}

class TextBuilder: ViewModelBuilderProtocol {
    let defaultBuilder = MessageViewModelDefaultBuilder()
    
    func canCreateViewModel(fromModel decoratedTextMessage: Any) -> Bool {
        return decoratedTextMessage is TextModel
    }
    func createViewModel(_ decoratedTextMessage: TextModel) -> ViewModel {
        let textmessageViewModel = ViewModel(textMessage: decoratedTextMessage, messageViewModel: defaultBuilder.createMessageViewModel(decoratedTextMessage))
        return textmessageViewModel
    }
   
    
}


