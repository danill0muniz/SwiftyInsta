//
//  UploadMediaModel.swift
//  SwiftyInsta
//
//  Created by Mahdi on 11/16/18.
//  Copyright © 2018 Mahdi. All rights reserved.
//

import Foundation

public protocol UploadMediaProtocol {
    var image: UIImage {get}
    var caption: String {get}
    var width: Int {get}
    var height: Int {get}
}

public struct InstaPhoto: UploadMediaProtocol {
    public var image: UIImage
    public var caption: String
    public var width: Int
    public var height: Int
    
    public init(image: UIImage, caption: String, width: Int, height: Int) {
        self.image = image
        self.caption = caption
        self.width = width
        self.height = height
    }
}

public struct InstaVideo: UploadMediaProtocol {
    public var image: UIImage
    public var caption: String
    public var width: Int
    public var height: Int
    public var type: Int
    
    public init(image: UIImage, caption: String, width: Int, height: Int, type: Int) {
        self.image = image
        self.caption = caption
        self.width = width
        self.height = height
        self.type = type
    }
}

public struct UploadPhotoResponse: Codable, BaseStatusResponseProtocol {
    var media: MediaModel?
    var uploadId: String?
    var status: String?
}

public struct UploadPhotoAlbumResponse: Codable, BaseStatusResponseProtocol {
    var clientSidecarId: String?
    var media: MediaModel?
    var status: String?
}

struct ConfigurePhotoModel: Codable {
    let _uuid: String
    let _uid: Int
    let _csrftoken: String
    let media_folder: String
    let source_type: String
    let caption: String
    let upload_id: String
    let device: ConfigureDevice
    let edits: ConfigureEdits
    let extras: ConfigureExtras
}

struct ConfigureDevice: Codable {
    let manufacturer: String
    let model: String
    let android_version: String
    let android_release: String
}

struct ConfigureEdits: Codable {
    let crop_original_size: [Int]
    let crop_center: [Double]
    let crop_zoom: Int
}

struct ConfigureExtras: Codable {
    let source_width: Int
    let source_height: Int
}

struct ConfigurePhotoAlbumModel: Codable {
    let _uuid: String
    let _uid: Int
    let _csrftoken: String
    let caption: String
    let client_sidecar_id: String
    let geotag_enabled: Bool
    let disable_comments: Bool
    let children_metadata: [ConfigureChildren]
}

struct ConfigureChildren: Codable {
    let scene_capture_type: String
    let mas_opt_in: String
    let camera_position: String
    let allow_multi_configures: Bool
    let geotag_enabled: Bool
    let disable_comments: Bool
    let source_type: Int
    let upload_id: String
}
