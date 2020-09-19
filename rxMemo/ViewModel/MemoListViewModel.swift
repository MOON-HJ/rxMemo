//
//  MomoListViewModel.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoListViewModel: CommonViewModel{
    var memoList: Observable<[Memo]> {
        return storage.memoList().map{ (item) -> [Memo] in
            return item.sorted{ $0.content < $1.content }
            
        }
    }
    
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action { input in
            return self.storage.update(memo: memo, content: input).map{ _ in }
        }
    }
    
    func performCancle(memo: Memo) -> CocoaAction {
        return Action {
            return self.storage.delete(memo: memo).map{ _ in }
        }
    }
    func makeCreateAction() -> CocoaAction {
        return CocoaAction {_ in return self.storage.createMemo(content: "")
            .flatMap{memo -> Observable<Void> in
                let composeViewModel = MemoComposeViewModel(title: "새 메모", sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: memo), cancleAction: self.performCancle(memo: memo))
                
                
                
                let composeScene = Scene.compose(composeViewModel)
                return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true).asObservable().map{ _ in }
            }
        }
        
    }
    
    lazy var detailAction:Action<Memo, Void> = {
        return Action { memo in
            let detailViewModel = MemoDetailViewModel(memo: memo, title: "메모 보기", sceneCooordinator: self.sceneCoordinator, storage: self.storage)
            
            
            let detailScene = Scene.detail(detailViewModel)
            
            return self.sceneCoordinator.transition(to: detailScene, using: .push, animated: true).asObservable().map{ _ in }
            
            
        }
    }()
    
    lazy var deleteAction: Action<Memo, Swift.Never> = {
        return Action { memo in
            return self.storage.delete(memo: memo).ignoreElements()
        }
    }()
}
