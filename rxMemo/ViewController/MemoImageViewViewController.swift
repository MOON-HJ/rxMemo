//
//  MemoImageViewViewController.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/30.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import UIKit

class MemoImageViewController: UIViewController, ViewModelBindableType {
        var viewModel: MemoImageViewModel!
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var cancleButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func bindViewModel() {
        viewModel.title.drive(navigationItem.rx.title).disposed(by: rx.disposeBag)
        cancleButton.rx.action = viewModel.cancleAction
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
