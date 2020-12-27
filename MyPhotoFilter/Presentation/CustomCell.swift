//
//  CustomCell.swift
//  MyPhotoFilter
//
//  Created by Leo on 2020/12/27.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func configure(by model: CellModel) {
        descriptionLabel.text = model.subtitle
        imgView.image = model.image
    }
}

extension CustomCell {
    struct CellModel {
        var imgUrl: String = ""
        @DummyValue(wrappedValue: "RxSwift是一個非常nice的框架")
        var subtitle: String?
        @DummyValue(wrappedValue: UIImage(named: "icon"))
        var image: UIImage?
        
        init(_ bean: PhotoBeanElement? = nil) {
            self.subtitle = bean?.title
            self.imgUrl = bean?.thumbnailURL ?? ""
        }
    }
}

@propertyWrapper
struct DummyValue<Value> {
    private var value: Value
    
    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set { value = newValue }
    }
}