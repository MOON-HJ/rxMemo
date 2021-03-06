//
//  Scene.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
    case imageview(MemoImageViewModel)
}

extension Scene {
    func instantiate(from storyboard : String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav") as? UINavigationController else {
                fatalError()

            }
            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }

            listVC.bind(viewModel: viewModel)
            return nav
            
        case .detail(let viewModel):
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? MemoDetailViewController else {
                fatalError()
            }
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else {
                fatalError()
            }
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            
            composeVC.bind(viewModel: viewModel)
            return nav
            
        case .imageview(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "imageViewNav") as? UINavigationController else {
                fatalError()
            }
            
            guard var imageViewVC = nav.viewControllers.first as? MemoImageViewController else {
                fatalError()
            }
            
            imageViewVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
