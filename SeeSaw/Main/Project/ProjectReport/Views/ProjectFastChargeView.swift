//
//  ProjectFastChargeVIew.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectFastChargeView: View {
    var value: [String] = ["희망", "성장", "끈기"]
    var valueNum: [Int] = [41, 34, 22]
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 0) {
                Text("\(value[0]) 고속충전 ")
                    .foregroundColor(.Gray900)
                Text("\(valueNum[0])")
                    .foregroundColor(.SeeSawBlue)
                Text("회")
                    .foregroundColor(.Gray900)
            }
            HStack(spacing: 0) {
                Text("\(value[1]) 고속충전 ")
                    .foregroundColor(.Gray900)
                Text("\(valueNum[1])")
                    .foregroundColor(.SeeSawBlue)
                Text("회")
                    .foregroundColor(.Gray900)
            }
            HStack(spacing: 0) {
                Text("\(value[2]) 고속충전 ")
                    .foregroundColor(.Gray900)
                Text("\(valueNum[2])")
                    .foregroundColor(.SeeSawBlue)
                Text("회")
                    .foregroundColor(.Gray900)
            }
            .padding(.bottom, 48)
            
            Image("ProjectBatteryImage")
                .resizable()
                .frame(width: 250, height: 350)
            
            HStack {
                Spacer()
            }
            
            Spacer()
        }
        .font(.ssWhiteTitle1)
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}

struct ProjectFastChargeView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectFastChargeView()
    }
}
