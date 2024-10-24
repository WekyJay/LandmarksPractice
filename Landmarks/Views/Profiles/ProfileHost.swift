//
//  ProfileHost.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/24.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @Environment(\.editMode) var editMode // 这行代码声明了一个环境变量editMode，它用于获取当前的编辑模式状态。
    @Environment(ModelData.self) var modelData


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            // Edit切换编辑视图
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear { // 视窗开启读取数据
                        draftProfile = modelData.profile
                    }
                    .onDisappear { // 视窗关闭保存数据
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHost().environment(ModelData())
}
