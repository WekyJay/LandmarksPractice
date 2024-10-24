//
//  CategoryHome.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData // 全局视图响应数据
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationSplitView { // 分栏窗口
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured") // 导航标题
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome().environment(ModelData())
}
