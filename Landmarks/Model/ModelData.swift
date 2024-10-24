//
//  ModelData.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/23.
//

import Foundation

@Observable
class ModelData { // 监视者，监视后swift会监视与视图有关联的数据变化。
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var profile = Profile.default //包含用户配置文件的实例，该实例即使在用户关闭配置文件视图后仍然存在。
    /**
     *这段代码定义了一个 categories 属性，它根据 landmarks 数组中每个地标的类别
     *将地标分组到一个字典中，字典的键是类别的字符串表示，值是具有相同类别的所有地标的数组。
     * @return Dictionary: landmarks
     **/
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    // 被推荐的地点
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
