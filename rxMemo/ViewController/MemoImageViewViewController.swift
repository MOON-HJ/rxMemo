//
//  MemoImageViewViewController.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/30.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MemoImageViewController: UIViewController, ViewModelBindableType {
    var viewModel: MemoImageViewModel!
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var cancleButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func bindViewModel() {
        viewModel.title.drive(navigationItem.rx.title).disposed(by: rx.disposeBag)
        cancleButton.rx.action = viewModel.cancleAction
        
        editButton.rx.tap.throttle(.microseconds(500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                        let vc = UIImagePickerController()
                        self?.present(vc, animated: true, completion: nil)
            }).disposed(by: rx.disposeBag)
        
        saveButton.rx.tap.throttle(.milliseconds(500), scheduler: MainScheduler.instance)
            .withLatestFrom(imageView.rx.image)
            .bind(to: viewModel.saveAction.inputs).disposed(by: rx.disposeBag)
    }
}
