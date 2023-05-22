//
//  FinalReviewView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct FinalReviewView: View {
    @State var show: Bool = false
    @State var showNext: Bool = false
    var userName: String = "에몽"
    var projectTitle: String = "큐시즘 밋업데이"
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .leading) {
            if showNext == false {
                Text("\(userName)님 벌써")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                HStack(spacing: 0) {
                    Text("\(projectTitle)")
                        .font(.ssHeading2)
                        .foregroundColor(.SeeSawBlue)
                    Text("의")
                        .font(.ssHeading2)
                        .foregroundColor(.Gray900)
                }
                Text("마무리 지점에 도착했어요")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                Spacer()
                    .frame(height: 20)
                Text("회고를 시작해볼까요?")
                    .font(.ssHeading2)
                    .foregroundColor(.Gray900)
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(1.0), value: show)
                Spacer()
                    .frame(width: UIScreen.main.bounds.size.width - 40, height: 20)
                Text("마지막 회고는 완료하면 수정이 불가능해요")
                    .fontWeight(.medium)
                    .font(.system(size: 14))
                    .foregroundColor(.Gray500)
                    .opacity(show ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0).delay(2.0), value: show)
                Spacer()
            } else {
                InterimReviewMainView(userName: self.userName, projectTitle: self.projectTitle)
            }
        }
        .onAppear {
            show = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
              showNext = true
            }
          }
        .padding(20)
        .navigationBarTitle("마지막 회고", displayMode: .inline)
        .foregroundColor(.Gray500)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        )
    }
}

struct FinalReviewView_Previews: PreviewProvider {
    static var previews: some View {
        FinalReviewView()
    }
}