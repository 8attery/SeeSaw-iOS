//
//  SeeSawTabView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import SwiftUI

struct SeeSawTabView: View {
    var body: some View {
        TabView {
            ValueView()
                .tabItem {
                    TabItem(imageName: "heart", title: "가치 설계")
                }
            
            EnergyView()
                .tabItem {
                    TabItem(imageName: "battery.100", title: "에너지")
                }
            
            ProjectView()
                .tabItem {
                    TabItem(imageName: "book.closed.fill", title: "프로젝트")
                }
            
            MyPageView()
                .tabItem {
                    TabItem(imageName: "person", title: "마이페이지")
                }
        }
    }
}

struct TabItem: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(title)
        }
    }
}

struct SeeSawTabView_Previews: PreviewProvider {
    static var previews: some View {
        SeeSawTabView()
    }
}