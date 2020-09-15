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

class MemoListViewModel: CommonViewModel{
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
