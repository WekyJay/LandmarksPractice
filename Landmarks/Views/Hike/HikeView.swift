//
//  HikeView.swift
//  Landmarks
//
//  Created by MacBook on 2024/10/24.
//

import SwiftUI



extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity), // 进入动画
            removal: .scale.combined(with: .opacity) // 退出动画
        )
    }
}

struct HikeView: View {
    
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack{
            HStack{
                //TODO: 展示视图缩略图
                HikeGraph(hike: hike, path: \.elevation).frame(width: 50, height: 30)
                VStack(alignment: .leading) {
                                    Text(hike.name)
                                        .font(.headline)
                                    Text(hike.distanceText)
                                }
                Spacer()
                
                Button {
                    withAnimation{
                             showDetail.toggle()
                     }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                       // .animation(nil, value: showDetail)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
//                        .animation(.spring(), value: showDetail)
                    
                }
            }
            if showDetail {
                
                //TODO: 展示详情视图
                HikeDetail(hike: hike).transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
