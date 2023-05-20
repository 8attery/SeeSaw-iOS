//
//  SelectDeleteAccountView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/04.
//

import SwiftUI

struct SelectDeleteAccountView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("정말 시소를 떠날 건가요?")
                .font(.ssHeading2)
                .foregroundColor(.Gray900)
                .padding(.top, 32)
                .padding(.bottom, 12)
            Text("지금 시소를 탈퇴하게 되면\n모든 데이터와 기록이 사라지고\n복원되지 않아요")
                .lineSpacing(2)
                .font(.ssBlackBody1)
                .foregroundColor(.Gray900)
            
            Spacer()
            
            VStack {
                Button {
                    // TODO: 회원탈퇴 서버 연동
                    dismiss()
                } label: {
                    CapsuleButtonView(color: Color.Gray400, text: "탈퇴할래요", size: .large)
                        .padding(.bottom, 12)
                }
                
                Button {
                    dismiss()
                } label: {
                    CapsuleButtonView(color: Color.Gray900, text: "탈퇴 안 할래요", size: .large)
                        .padding(.bottom, 20)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SelectDeleteAccountView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDeleteAccountView()
    }
}
