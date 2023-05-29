//
//  ProjectRegularAnswerTimeView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectRegularAnswerTimeView: View {
    var regularAnswerTime: Int = 10
    var date1: String
    var answer1: String
    var date2: String
    var answer2: String
    var date3: String
    var answer3: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 2) {
                Text("상시 회고를")
                    .foregroundColor(.Gray900)
                    .padding(.bottom, 6)
                HStack {
                    Text("\(regularAnswerTime)")
                        .foregroundColor(.SeeSawBlue)
                    Text("번 남겼어요")
                        .foregroundColor(.Gray900)
                }
            }
            .font(.ssHeading2)
            .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(date1)
                    .font(.ssWhiteBody2)
                    .foregroundColor(.Gray400)
                Text(answer1)
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray700)
                    .lineSpacing(2)
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(date2)
                    .font(.ssWhiteBody2)
                    .foregroundColor(.Gray400)
                Text(answer2)
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray700)
                    .lineSpacing(2)
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(date3)
                    .font(.ssWhiteBody2)
                    .foregroundColor(.Gray400)
                Text(answer3)
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray700)
                    .lineSpacing(2)
            }
            
            HStack {
                Spacer()
            }
            
            Spacer()
        }
        .padding(24)
        .frame(width: 300, height: 550)
        .background(Color.Gray100)
    }
}
