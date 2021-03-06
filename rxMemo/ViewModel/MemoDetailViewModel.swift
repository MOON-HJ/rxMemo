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
    
    
    func performUpdate(memo: Memo) -> Action<String, Void> {
        return Action   { input in
            self.storage.update(memo: memo, content: input)
                .subscribe(onNext: { updated in
                    self.contents.onNext( [
                                            updated.content, self.formatter.string(from: updated.insertDate)])
                })
                .disposed(by: self.rx.disposeBag)
            return Observable.empty()
        }
    }
    
    func makeEditAction() -> CocoaAction {
        return CocoaAction { _ in
            let composeViewModel = MemoComposeViewModel(title: "메모 편집", content: self.memo.content, sceneCoordinator: self.sceneCoordinator, storage: self.storage, saveAction: self.performUpdate(memo: self.memo))
            
            let composeScene = Scene.compose(composeViewModel)
            
            return self.sceneCoordinator.transition(to: composeScene, using: .modal, animated: true).asObservable().map{ _ in }
        }
    }
    
    func imageViewAction() -> CocoaAction {
        return CocoaAction { _ in
            let imageViewModel = MemoImageViewModel(title: "사진", image: self.memo.image, sceneCoordinator: self.sceneCoordinator, storage:  self.storage, saveAction: nil)
            
            let imageViewScene = Scene.imageview(imageViewModel)
            
            return self.sceneCoordinator.transition(to: imageViewScene, using: .modal, animated: true).asObservable().map{ _ in }
        }
    }
    
    func makeDeleteAction() -> CocoaAction{
        return Action { input in
            self.storage.delete(memo: self.memo)
            return self.sceneCoordinator.close(animated: true).asObservable().map { _ in }
        }
    }
}
