//
//  Score_WidgetBundle.swift
//  Score Widget
//
//  Created by Іван Захарчук on 13.02.2023.
//

import WidgetKit
import SwiftUI

@main
struct Score_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Score_Widget()
        Score_WidgetLiveActivity()
    }
}
