//
//  MemoryStorage.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType {
    
    private var list = [
        Memo(content: "Hello RxSwift", insertDate: Date().addingTimeInterval(-10), image:nil),
        Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20), image: nil)]
    
    private lazy var sectionModel = MemoSelectionModel(model: 0, items: list)
    
    private lazy var store = BehaviorSubject<[MemoSelectionModel]>(value: [sectionModel])
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content, image: nil)
        sectionModel.items.insert(memo, at: 0)
        store.onNext([sectionModel])
        
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[MemoSelectionModel]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content, updatedImage: nil)
        if let index = sectionModel.items.firstIndex(where: {$0 == memo}) {
            sectionModel.items.remove(at: index)
            sectionModel.items.insert(updated, at: index)
            
        }
        store.onNext([sectionModel])
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = sectionModel.items.firstIndex(where: {$0 == memo}){
            sectionModel.items.remove(at: index)
        }
        store.onNext([sectionModel])
        
        return Observable.just(memo)
    }
}
