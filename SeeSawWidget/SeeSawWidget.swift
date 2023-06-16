//
//  SeeSawWidget.swift
//  SeeSawWidget
//
//  Created by 이안진 on 2023/06/16.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct SeeSawWidgetEntryView: View {
    @Environment(\.widgetFamily) private var widgetFamily

        var entry: Provider.Entry
        
        var body: some View {
            switch widgetFamily {
            case .accessoryCircular:
                Text("wow")
                    .font(.title)
            case .systemSmall:
                ZStack {
                    Color.white
                    VStack {
                        Text("에너지 배터리")
                            .bold()
                        ZStack {
                            Circle()
                                .foregroundColor(.green)
                            Text("80%")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding(20)
                }
            default:
                Text("?")
            }
        }
}

struct SeeSawWidget: Widget {
    let kind: String = "SeeSawWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SeeSawWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("SeeSaw")
        .description("빠르게 에너지 배터리를 확인하세요")
        .supportedFamilies([.accessoryCircular, .systemSmall])
    }
}

struct SeeSawWidget_Previews: PreviewProvider {
    static var previews: some View {
        SeeSawWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
