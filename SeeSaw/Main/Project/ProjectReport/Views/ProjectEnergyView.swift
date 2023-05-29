//
//  ProjectEnergyVIew.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectEnergyView: View {
    @AppStorage("nickname") var nickname: String = ""
    var averageProgress: Int = 71
    var maxProgress: Int = 86
    var minProgress: Int = 37
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("프로젝트를 진행하는 동안의\n\(nickname)님 에너지 분석입니다")
                    .font(.ssWhiteTitle1)
                    .foregroundColor(.Gray900)
                    .lineSpacing(2)
                    
                Spacer()
            }
            .padding(.bottom, 24)
            
            ZStack {
                ProjectBatteryView(progress: Double(averageProgress) / 100)
                VStack(spacing: 4) {
                    Text("평균")
                        .font(.ssBlackBody2)
                        .foregroundColor(.Gray600)
                    Text("\(averageProgress)")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                }
            }
            
            ZStack {
                ProjectBatteryView(progress: Double(maxProgress) / 100)
                VStack(spacing: 4) {
                    Text("최고")
                        .font(.ssBlackBody2)
                        .foregroundColor(.Gray600)
                    Text("\(maxProgress)")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                }
            }
            ZStack {
                ProjectBatteryView(progress: Double(minProgress) / 100)
                VStack(spacing: 4) {
                    Text("최저")
                        .font(.ssBlackBody2)
                        .foregroundColor(.Gray600)
                    Text("\(minProgress)")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                }
            }
            
            HStack {
                Spacer()
            }
            
            Spacer()
        }
        .padding(24)
        .background(Color.Gray100)
    }
}

struct ProjectEnergyView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectEnergyView()
    }
}
