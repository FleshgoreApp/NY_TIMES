//
//  News.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import Foundation
import JSONParsing

struct News {
    let uri:            String?
    let url:            String?
    let id:             Int?
    let asset_id:       Int?
    let source:         String?
    let published_date: String?
    let updated:        String?
    let section:        String?
    let subsection:     String?
    let nytdsection:    String?
    let adx_keywords:   String?
    let byline:         String?
    let type:           String?
    let title:          String?
    let abstract:       String?
    let des_facet:      [String]?
    let org_facet:      [String]?
    let per_facet:      [String]?
    let geo_facet:      [String]?
    let media:          [Media]?
    let eta_id:         Int?
    var createdToDB:         Double? = nil
    var imageDataFromDB:     Data? = nil
    var thumbnailDataFromDB: Data? = nil
    var isFavorites: Bool = false
}

extension News: JSONParseable {
    static func parse(_ json: JSON) throws -> News {
        return try News(uri: json["uri"]^,
                        url: json["url"]^,
                        id: json["id"]^,
                        asset_id: json["asset_id"]^,
                        source: json["source"]^,
                        published_date: json["published_date"]^,
                        updated: json["updated"]^,
                        section: json["section"]^,
                        subsection: json["subsection"]^,
                        nytdsection: json["nytdsection"]^,
                        adx_keywords: json["adx_keywords"]^,
                        byline: json["byline"]^,
                        type: json["type"]^,
                        title: json["title"]^,
                        abstract: json["abstract"]^,
                        des_facet: json["des_facet"]^^,
                        org_facet: json["org_facet"]^^,
                        per_facet: json["per_facet"]^^,
                        geo_facet: json["geo_facet"]^^,
                        media: json["media"]^^,
                        eta_id: json["eta_id"]^)
    }

}

struct Media {
    let type:      String?
    let subtype:   String?
    let caption:   String?
    let copyright: String?
    let approved_for_syndication: Bool?
    let mediaMetadata: [MediaMetadata]?
}

extension Media: JSONParseable {
    static func parse(_ json: JSON) throws -> Media {
        return try Media(type: json["type"]^,
                         subtype: json["subtype"]^,
                         caption: json["caption"]^,
                         copyright: json["copyright"]^,
                         approved_for_syndication: json["approved_for_syndication"]^,
                         mediaMetadata: json["media-metadata"]^^)
    }
}

struct MediaMetadata {
    let url: String?
    let format: String?
    let height: Int?
    let width: Int?
}

extension MediaMetadata: JSONParseable {
    static func parse(_ json: JSON) throws -> MediaMetadata {
        return try MediaMetadata(url: json["url"]^,
                                 format: json["format"]^,
                                 height: json["height"]^,
                                 width: json["width"]^)
    }
}

protocol NewsViewItemInterface {
    var imageURL: URL? { get }
    var thumbnailURL: URL? { get }
    var newsTitle: String? { get }
    var updatedDate: String? { get }
    var author: String? { get }
    var news: String? { get }
    var imageFromDB: UIImage { get }
    var thumbnailFromDB: UIImage { get }
    var isFavoritesNews: Bool { get }
}

extension News: NewsViewItemInterface {
    var imageURL: URL? {
        guard let urlString = media?.first?.mediaMetadata?.last?.url else { return nil }
        return URL(string: urlString)
    }
    
    var thumbnailURL: URL? {
        guard let urlString = media?.first?.mediaMetadata?.first?.url else { return nil }
        return URL(string: urlString)
    }
    
    var newsTitle: String? {
        guard let title = title else {
            return nil
        }
        return title
    }
    
    var updatedDate: String? {
        return updated
    }

    var author: String? {
        return byline
    }
    
    var news: String? {
        return abstract
    }
    
    var imageFromDB: UIImage {
        guard let data = imageDataFromDB else {
            return UIImage(named: "noImage") ?? UIImage()
        }
        return UIImage(data: data) ?? UIImage()
    }
    
    var thumbnailFromDB: UIImage {
        guard let data = thumbnailDataFromDB else {
            return UIImage(named: "noImage") ?? UIImage()
        }
        return UIImage(data: data) ?? UIImage()
    }
    
    var isFavoritesNews: Bool {
        return CoreDataManager.shared.isFavoritesNews(id ?? 0)
    }
}
