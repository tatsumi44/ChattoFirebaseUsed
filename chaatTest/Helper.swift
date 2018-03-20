//
//  Helper.swift
//  chaatTest
//
//  Created by tatsumi kentaro on 2018/03/20.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit

extension UIViewController{
    @objc func  showingKeybord(notification: Notification) {
        if let keybordHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.height{
            
            self.view.frame.origin.y = -keybordHeight
        }
        
    }
    
    @objc func hidingKeyboard(){
        self.view.frame.origin.y = 0
    }
}
