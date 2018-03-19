//
//  PhotoBuilder.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/19.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import Chatto
import ChattoAdditions

class PhotoViewModel: PhotoMessageViewModel<PhotoModel> {
    
    
    override init(photoMessage: PhotoModel, messageViewModel: MessageViewModelProtocol) {
        super.init(photoMessage: photoMessage, messageViewModel: messageViewModel)
        
    }
}

class PhotoBuilder: ViewModelBuilderProtocol {
    typealias ModelT = PhotoModel

    typealias ViewModelT = PhotoViewModel

    
    let defaultBuilder = MessageViewModelDefaultBuilder()

    func canCreateViewModel(fromModel decoratedPhotoMessage: Any) -> Bool {
        return decoratedPhotoMessage is PhotoModel
    }
    
    func createViewModel(_ decoratedPhotoMessage: PhotoModel ) -> PhotoBuilder.ViewModelT {
        let photoMessagemModel = PhotoViewModel(photoMessage: decoratedPhotoMessage, messageViewModel: defaultBuilder.createMessageViewModel(decoratedPhotoMessage))
        return photoMessagemModel
    }
}
