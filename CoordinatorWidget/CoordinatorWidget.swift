//
//  CoordinatorWidget.swift
//  CoordinatorWidget
//
//  Created by Denis Dmitriev on 03.08.2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    let fruit = Fruit.cherry
    
    func placeholder(in context: Context) -> FruitEntry {
        FruitEntry(fruit: fruit, date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (FruitEntry) -> ()) {
        let entry = FruitEntry(fruit: fruit, date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [FruitEntry] = []
        
        let currentDate = Date()
        let midnight = Calendar.current.startOfDay(for: currentDate)
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
        
        for offset in 0 ..< 60 * 24 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: midnight)!
            let entryFruit = Fruit.allCases.randomElement() ?? .cherry
            let entry = FruitEntry(fruit: entryFruit, date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        completion(timeline)
    }
}

struct FruitEntry: TimelineEntry {
    let fruit: Fruit
    let date: Date
}

struct CoordinatorWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        Text(entry.fruit.emoji)
            .font(.system(size: 64))
        .widgetURL(entry.fruit.url)
    }
}

struct CoordinatorWidget: Widget {
    let kind: String = "CoordinatorWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CoordinatorWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Fruit Widget")
        .description("This is an example coordinator widget.")
    }
}

struct CoordinatorWidget_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorWidgetEntryView(entry: FruitEntry(fruit: Fruit.cherry, date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
