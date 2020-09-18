//
//  MemoDetailViewModel.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoDetailViewModel: CommonViewModel{
    let memo: Memo
    
    private var formatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "Ko_kr")
        f.dateStyle = .medium
        f.timeStyle = .medium
        return f
    }()
    
    var contents: BehaviorSubject<[String]>
    
    init(memo : Memo, title:String, sceneCooordinator: SceneCoordinator, storage: MemoStorageType) {
        self.memo = memo
        contents = BehaviorSubject<[String]>(value: [
            memo.content, formatter.string(from: memo.insertDate)])
        
        super.init(title: title, sceneCoordinator: sceneCooordinator, storage: storage)
        
        
    }
    
    lazy var popAction = CocoaAction {[ unowned self]  in
        return self.sceneCoordinator.close(animated: true).asObservable().map { _ in }
    }

}
