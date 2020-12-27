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
    
    let keyword = BehaviorRelay<String?>(value: nil)
    
    var tableViewData = BehaviorRelay<[CellModel]>(value: [
        CellModel()+.subtitle("hihi")-,
        CellModel()+.subtitle("给了我们很多的封装")-,
        CellModel()+.subtitle("流程简化，代码精简")-,
        CellModel()+.subtitle("还有学习成本还是有一定难度的")-,
        CellModel()
    ])
}
