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
        var image: UIImage?
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

@dynamicMemberLookup
struct Fluent<Subject> {
    let subject: Subject
    
    subscript<Value>(dynamicMember keyPath: WritableKeyPath<Subject, Value>) -> ((Value) -> Fluent) {
        var subject = self.subject
        return { value in
            subject[keyPath: keyPath] = value
            return Fluent(subject: subject)
        }
    }
}

postfix operator +

@discardableResult
postfix func + <T>(lhs: T) -> Fluent<T> {
    return Fluent(subject: lhs)
}
 
postfix operator -

@discardableResult
postfix func - <T>(lhs: Fluent<T>) -> T {
    return lhs.subject
}
