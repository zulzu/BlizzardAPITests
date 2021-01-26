
import Foundation

class MediaLink: Codable {
    let key: Link<Media>
    let id: Int
}

class Media: Codable {
    let _links: SelfLink<Media>
    let assets: [MediaAsset]
}

class MediaAsset: Codable {
    let key: String
    let value: String
}
