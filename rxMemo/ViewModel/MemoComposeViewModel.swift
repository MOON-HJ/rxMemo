//
//  MemoComposeViewModel.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoComposeViewModel: CommonViewModel{
    private let content: String?
    var inititalText: Driver<String?> {
        return Observable.just(content).asDriver(onErrorJustReturn: nil)
        
    }
    
    let saveAction: Action<String,Void>
    let cancleAction: CocoaAction
    
    init(title: String, content: String? = nil, sceneCoordinator: SceneCoordinator, storage: MemoStorageType, saveAction: Action<String, Void>? = nil, cancleAction: CocoaAction? = nil) {
        self.content = content
        
        self.saveAction = Action<String, Void> { input in
            if let action = saveAction {
                action.execute(input)
            }
            
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        self.cancleAction = CocoaAction {
            if let action = cancleAction {
                action.execute()
            }
            
            return sceneCoordinator.close(animated: true).asObservable().map{ _ in }
        }
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
        
    }
}
