//
//  NASAImageViewerModels.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import Foundation

struct SearchResult: Codable {
    let collection: Collection
}

// MARK: - Collection
struct Collection: Codable {
    let items: [Item]
    let version: String
    let href: String
    let links: [CollectionLink]
    let metadata: Metadata
}

// MARK: - Item
struct Item: Codable {
    let href: String
    let links: [ItemLink]
    let data: [Datum]
}

extension Datum {
    func subtitle()-> NSAttributedString {
        let string = (self.photographer ?? "") + " | " + Formatter.dateString(from: self.dateCreated )
        return NSMutableAttributedString().normal(string)
    }
    func mainTitle()-> NSAttributedString {
        return NSMutableAttributedString().bold(self.title)
    }
}

// MARK: - Datum
struct Datum: Codable {
    let keywords: [String]?
    let mediaType: MediaType
    let nasaID: String
    let dateCreated: Date
    let datumDescription: String
    let center: Center
    let title: String
    let photographer, description508, secondaryCreator, location: String?
    let album: [String]?

    enum CodingKeys: String, CodingKey {
        case keywords
        case mediaType = "media_type"
        case nasaID = "nasa_id"
        case dateCreated = "date_created"
        case datumDescription = "description"
        case center, title, photographer
        case description508 = "description_508"
        case secondaryCreator = "secondary_creator"
        case location, album
    }
}

enum Center: String, Codable {
    case arc = "ARC"
    case gsfc = "GSFC"
    case hq = "HQ"
    case jpl = "JPL"
    case jsc = "JSC"
    case ksc = "KSC"
}

enum MediaType: String, Codable {
    case image = "image"
    case video = "video"
}

// MARK: - ItemLink
struct ItemLink: Codable {
    let render: MediaType?
    let rel: Rel
    let href: String
}

enum Rel: String, Codable {
    case captions = "captions"
    case preview = "preview"
}

// MARK: - CollectionLink
struct CollectionLink: Codable {
    let prompt, rel: String
    let href: String
}

// MARK: - Metadata
struct Metadata: Codable {
    let totalHits: Int

    enum CodingKeys: String, CodingKey {
        case totalHits = "total_hits"
    }
}
