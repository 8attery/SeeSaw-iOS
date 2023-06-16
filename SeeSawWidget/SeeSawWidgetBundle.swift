//
//  SeeSawWidgetBundle.swift
//  SeeSawWidget
//
//  Created by 이안진 on 2023/06/16.
//

import SwiftUI
import WidgetKit

@main
struct SeeSawWidgetBundle: WidgetBundle {
    var body: some Widget {
        SeeSawWidget()
        SeeSawWidgetLiveActivity()
    }
}
