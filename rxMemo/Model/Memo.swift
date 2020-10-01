//
//  Memo.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxDataSources

struct Memo: Equatable, IdentifiableType {
    var content: String
    var insertDate: Date
    var identity:String
    var image:Data?
    
    init(content:String, insertDate:Date = Date(), image:Data?) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
        self.image = image
    }
    
    init(original:Memo, updatedContent:String, updatedImage:Data?){
        self = original
        self.content = updatedContent
        self.image = updatedImage
    }
}
