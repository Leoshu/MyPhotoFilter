//
//  ViewModel.swift
//  MyPhotoFilter
//
//  Created by Leo on 2020/12/27.
//

import Foundation
import RxCocoa
import RxSwift

class ViewModel {
    
    typealias CellModel = CustomCell.CellModel
    
    let searchText = BehaviorRelay<String?>(value: nil)
    
    let fetchData  = BehaviorRelay<[CellModel]>(value: [
        CellModel()+.subtitle("hihi")-,
        CellModel()+.subtitle("给了我们很多的封装")-,
        CellModel()+.subtitle("流程简化，代码精简")-,
        CellModel()+.subtitle("还有学习成本还是有一定难度的")-,
        CellModel()
    ])
     
    lazy var tableViewData = Observable.combineLatest(searchText.asObservable(), fetchData.asObservable()).map { (keyword, models) -> [CellModel] in
        guard let txt = keyword, txt.count > 0 else { return models }
        return models.filter { ($0.subtitle?.lowercased() ?? "").contains(txt.lowercased()) }
    }
    
}
