//
//  PhotoBean.swift
//  MyPhotoFilter
//
//  Created by Leo on 2020/12/28.
//

import Foundation

// MARK: - PhotoBeanElement
struct PhotoBeanElement: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias PhotoBean = [PhotoBeanElement]
