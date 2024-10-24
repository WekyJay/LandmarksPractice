//
//  .Landmark.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/23.
//

import Foundation
import SwiftUI
import CoreLocation // 坐标工具类

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // 计算坐标
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    // 坐标
    private var coordinates: Coordinates

    // 坐标结构
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}


