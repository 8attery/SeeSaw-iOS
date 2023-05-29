//
//  ProjectAnswerTimeView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectTodayAnswerTimeView: View {
    var answerTime: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("오늘의 회고 질문에")
                .foregroundColor(.Gray900)
                .padding(.bottom, 1)
            HStack(spacing: 0) {
                Text("총 ")
                    .foregroundColor(.Gray900)
                Text("\(answerTime)")
                    .foregroundColor(.SeeSawBlue)
                Text("번 답하셨어요")
                    .foregroundColor(.Gray900)
            }
            Image("QuestionImage")
            HStack {
                Spacer()
            }
            Spacer()
        }
        .font(.ssHeading2)
        .padding(27)
        .frame(height: 550)
        .background(Color.Gray100)
    }
}
