//
//  ProjectEmotionView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectEmotionView: View {
    @AppStorage("nickname") var nickname: String = ""
    var middleReview: String = "대학교에 입학하여 강의로만 접했던 이론들을 내가 직접 하고 있다는 게 기쁘다! 내 아이디어와 내가 한 일들이 하나의 프로젝트를 만들어간다는 것이 넘 기쁘다!"
    var finalReview: String = "힘든 순간도 많았다. 하지만 배움의 뿌듯함을 느끼는 순간이 더 많았다! 뭔가 힘든 건 그 순간인 거 같은데 한번 새로운 지식을 배운 거는 며칠 내내 뿌듯하고 행복한 것 같다,,, 😎"
    var firstEmoji: String = "LIKE"
    var secondEmoji: String = "NICE"
    var emojiString: [String: String] = ["LIKE": "행복", "NICE": "뿌듯함", "IDK": "아쉬움", "ANGRY": "힘듦", "SAD": "슬픔"]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            title
            .padding(.bottom, 28)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("중간 회고")
                    .font(.ssWhiteBody2)
                    .foregroundColor(.Gray400)
                    .padding(.bottom, 8)
                Text(middleReview)
                    .font(.ssBlackBody3)
                    .foregroundColor(.Gray700)
                    .lineSpacing(2)
            }
            .padding(.bottom, 30)
            
            ZStack(alignment: .bottomLeading) {
                Text("마지막 회고")
                    .font(.ssWhiteBody2)
                    .foregroundColor(.Gray400)
//                HStack {
//                    Spacer()
//                    Image(firstEmoji)
//                        .resizable()
//                        .frame(width: 100, height: 85)
//                        .offset(y: -4)
//                }
            }
            .padding(.bottom, 8)
            Text(finalReview)
                .font(.ssBlackBody3)
                .foregroundColor(.Gray700)
                .lineSpacing(2)
                .padding(.bottom, 20)
            HStack {
                Spacer()
            }
//            Image(secondEmoji)
//                .resizable()
//                .frame(width: 100, height: 85)
            Spacer()
        }
        .padding(24)
        .frame(height: 550)
        .background(Color.Gray100)
    }
    
    var title: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(nickname)님은")
                .foregroundColor(.Gray900)
                .lineSpacing(6)
            
            HStack {
                Text(emojiString[firstEmoji] ?? "")
                    .foregroundColor(.SeeSawBlue)
                Text("과")
                    .foregroundColor(.Gray900)
                Text(emojiString[secondEmoji] ?? "")
                    .foregroundColor(.SeeSawBlue)
                Text("의 감정을")
                    .foregroundColor(.Gray900)
            }
            
            Text("느꼈어요")
                .foregroundColor(.Gray900)
        }
        .font(.ssHeading2)
    }
}

struct ProjectEmotionView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectEmotionView()
    }
}
