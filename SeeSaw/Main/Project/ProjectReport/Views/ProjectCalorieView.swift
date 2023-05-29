//
//  ProjectCalorieView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectCalorieView: View {
    var calori: Int = 267
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("평균적으로")
                .foregroundColor(.Gray900)
            HStack(spacing: 0) {
                Text("하루 ")
                    .foregroundColor(.Gray900)
                Text("\(calori)")
                    .foregroundColor(.SeeSawBlue)
                Text("Kcal 움직였어요")
                    .foregroundColor(.Gray900)
            }
            .padding(.bottom, 48)
            
            Image("ProjectFireImage")
                .resizable()
                .frame(width: 250, height: 350)
            
            HStack {
                Spacer()
            }
            
            Spacer()
        }
        .font(.ssWhiteTitle1)
        .padding(24)
        .background(Color.Gray100)
    }
}

struct ProjectCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCalorieView()
    }
}
