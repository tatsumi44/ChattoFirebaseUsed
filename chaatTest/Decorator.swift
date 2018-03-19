//
//  Decorator.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class Decorator: ChatItemsDecoratorProtocol {
    func decorateItems(_ chatItems: [ChatItemProtocol]) -> [DecoratedChatItem] {
        var decoratedItems = [DecoratedChatItem]()
        
        let messageDecorationAttributes = BaseMessageDecorationAttributes(
            
            canShowFailedIcon: true,
            
            isShowingTail: false,
            
            isShowingSelectionIndicator: true,
            
            isSelected: true
        )
        for item in chatItems{
            let decoratedItem = DecoratedChatItem(chatItem: item, decorationAttributes: ChatItemDecorationAttributes(bottomMargin: 10, messageDecorationAttributes: messageDecorationAttributes))
            decoratedItems.append(decoratedItem)
        }
        return decoratedItems
    }
}
