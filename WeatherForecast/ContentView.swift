//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Nick Krasnitskiy on 23.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                DayForecast(day: "San", isRainy: false, high: 90, low: 30)
                DayForecast(day: "Thu", isRainy: true, high: 30, low: 10)
            }
        }
        
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(day)
                .font(.title)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)ºC")
                .fontWeight(.semibold)
            Text("Low: \(low)ºC")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
