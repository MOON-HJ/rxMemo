//
//  MemoDetailViewController.swift
//  rxMemo
//
//  Created by 문효재 on 2020/09/15.
//  Copyright © 2020 Moon HyoJae. All rights reserved.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {
    var viewModel: MemoDetailViewModel!
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var deleteButton: UIToolbar!
    
    @IBOutlet weak var editButton: UIToolbar!
    
    @IBOutlet weak var shareButton: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() {
        
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
