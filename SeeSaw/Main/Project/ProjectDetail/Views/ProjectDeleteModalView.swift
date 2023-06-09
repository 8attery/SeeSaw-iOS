//
//  ProjectDeleteModalView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/17.
//

import SwiftUI

struct ProjectDeleteModalView: View {
    var projectTitle: String
    var projectId: Int
    @Binding var showDeleteModal: Bool
    @Binding var showDeletePopUp: Bool
    @StateObject var projectDetailVM = ProjectDetailViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 12) {
            Color.Gray200.ignoresSafeArea()
            Text("프로젝트 편집")
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray500)
            Rectangle()
                .frame(width: 350, height: 2)
                .foregroundColor(.Gray300)
            Spacer()
                .frame(height: 36)
            Text(projectTitle)
                .font(.ssBlackSubTitle)
                .foregroundColor(.Gray700)
            Text("삭제하시겠어요?")
                .font(.ssBlackTitle2)
            Spacer()
                .frame(height: 40)
            Button {
                showDeletePopUp = true
                projectDetailVM.deleteProject(projectId: projectId)
                showDeleteModal = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                CapsuleButtonView(color: .Gray900, text: "삭제", size: .large)
            }
            Button {
                showDeleteModal = false
                presentationMode.wrappedValue.dismiss()
            } label: {
                CapsuleButtonView(color: .Gray400, text: "취소", size: .large)
            }
        }
        .padding(20)
    }
}
