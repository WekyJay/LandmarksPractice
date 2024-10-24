//
//  LandmarkList.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/23.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    
    // 计算属性，计算Landmark（默认为Get）
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
              (!showFavoritesOnly || landmark.isFavorite)
          }
      }
    
    var body: some View {
        NavigationSplitView {
            List {
                // 绑定按钮
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach (filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks) // 添加动画，绑定值的变化
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
