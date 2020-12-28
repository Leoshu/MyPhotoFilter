//
//  ViewController.swift
//  MyPhotoFilter
//
//  Created by Leo on 2020/12/27.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = ViewModel()
    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        searchBar.rx.text.orEmpty
                    .bind(to: viewModel.searchText)
                    .disposed(by: disposeBag)
        
        viewModel.tableViewData
            .bind(to: tableView.rx.items(cellIdentifier: "CustomCell",
                                      cellType: CustomCell.self)) { row, model, cell in
                cell.configure(by: model)
            }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(CustomCell.CellModel.self).subscribe(onNext: { (item) in
            item.log()
        }).disposed(by: disposeBag)
    }
}


