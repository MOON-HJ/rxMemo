//
//  MemoImageViewModel.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/30.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import Action
import RxCocoa
import RxSwift

class MemoImageViewModel: CommonViewModel {
    private let image: Data?
    
    let saveAction: Action<Data, Void>
    let cancleAction : CocoaAction
    
    init(title:String, image: Data?, sceneCoordinator: SceneCoordinator, storage:MemoStorageType, saveAction:Action<Data, Void>? = nil, cancleAction: CocoaAction? = nil) {
        self.image = image
        
        self.saveAction = Action<Data, Void> { input in
            if let action = saveAction {
                action.execute(input)
            }
            
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        self.cancleAction = CocoaAction {
            if let action = cancleAction {
                action.execute()
            }
            return sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
        
        super.init(title: title, sceneCoordinator: sceneCoordinator, storage: storage)
    }
}
