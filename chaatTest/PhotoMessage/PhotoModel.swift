//
//  PhotoModel.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class PhotoModel: PhotoMessageModel<MessageModel> {
    static let chatItemType = "photo"
    
    override init(messageModel: MessageModel, imageSize: CGSize, image: UIImage) {
        super.init(messageModel: messageModel, imageSize: imageSize, image: image )
    }
}
