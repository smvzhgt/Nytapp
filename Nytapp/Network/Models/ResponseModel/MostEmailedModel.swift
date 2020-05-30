//
//  MostEmailedModel.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import Foundation


final class MostEmailedArticleResponseModel: Codable {
    var status: String
    var copyright: String
    var num_results: Int
    var results: [MostEmailedArticleModel]
    
    init(status: String, copyright: String, num_results: Int, results: [MostEmailedArticleModel]) {
        self.status = status
        self.copyright = copyright
        self.num_results = num_results
        self.results = results
    }
}


final class MostEmailedArticleModel: Codable {
    var id: Int
    var url: String
    var title: String
    var abstract: String
    var media: [MediaModel]
    
    init(id: Int, url: String, title: String, abstract: String, media: [MediaModel]) {
        self.id = id
        self.url = url
        self.title = title
        self.abstract = abstract
        self.media = media
    }
}


final class MediaModel: Codable {
    var type: String
    var subtype: String
    var mediaMetadata: [MediaMetadataModel]
    
    init(type: String, subtype: String, mediaMetadata: [MediaMetadataModel]) {
        self.type = type
        self.subtype = subtype
        self.mediaMetadata = mediaMetadata
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case mediaMetadata = "media-metadata"
    }
}


class MediaMetadataModel: Codable {
    var url: String
    var format: String
    var height: Int
    var width: Int
    
    init(url: String, format: String, height: Int, width: Int) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
}
