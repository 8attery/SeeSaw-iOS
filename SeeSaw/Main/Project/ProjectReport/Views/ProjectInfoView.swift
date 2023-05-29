//
//  ProjectInfoView.swift
//  SeeSaw
//
//  Created by 정태우 on 2023/05/22.
//

import SwiftUI

struct ProjectInfoView: View {
    var projectColor: Color = .SeeSawBlue
    var projectReportInfo = ProjectReportInfo()
    @State var projectValue: String = ""
    @State var projectTitle: String = ""
    @State var projectStartDate: String = ""
    @State var projectEndDate: String = ""
    @State var projectStrength: String = ""
    @State var projectGoal: String = ""
    @State var jointProject: [String] = []
    
    var words: [String] {
        projectTitle.split(separator: " ").map { String($0) }
    }
    var firstHalf: String {
        words.prefix(words.count / 2).joined(separator: " ")
    }
    var secondHalf: String {
        words.suffix(from: words.count / 2).joined(separator: " ")
    }
    var goalWords: [String] {
        projectGoal.split(separator: " ").map { String($0) }
    }
    var goalFirstHalf: String {
        goalWords.prefix(words.count / 2).joined(separator: " ")
    }
    var goalSecondHalf: String {
        goalWords.suffix(from: words.count / 2).joined(separator: " ")
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Spacer()
                Text("\(projectValue)")
                    .font(.ssHeading1)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("\(firstHalf)\n\(secondHalf)")
                .lineSpacing(4)
                .font(.ssHeading1)
                .foregroundColor(.Gray100)
                .padding(.bottom, 4)
            
            HStack {
                Text("\(projectStartDate) - \(projectEndDate)")
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray100)
            }
            .padding(.bottom, 8)
            
            Text(projectStrength)
                .font(.ssBlackTitle2)
                .foregroundColor(.Gray100)
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background(Color.Gray900)
                .cornerRadius(90)
                .padding(.bottom, 12)
            
            Text("\(goalFirstHalf)\n\(goalSecondHalf)")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(.Gray100)
                .padding(.bottom, 16)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.Gray900)
                .padding(.bottom, 16)
            
            Text("함께 진행한 프로젝트")
                .font(.ssBlackBody3)
                .foregroundColor(.Gray900)
                .padding(.bottom, 8)
            
            HStack(spacing: 12) {
                ForEach(jointProject, id: \.self) { project in
                    Text(project)
                        .font(.ssBlackBody3)
                        .foregroundColor(.Gray900)
                }
            }
            .padding(.bottom, 24)
        }
        .onAppear {
            projectValue = projectReportInfo.value
            projectTitle = projectReportInfo.projectName
            projectStartDate = projectReportInfo.startedAt
            projectEndDate = projectReportInfo.endedAt
            projectStrength = projectReportInfo.projectIntensity
            projectGoal = projectReportInfo.projectGoal
            jointProject = projectReportInfo.jointProject
        }
        .padding(16)
        .background(projectColor)
    }
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

