//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Nick Krasnitskiy on 23.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            ScrollView(.horizontal) {
                HStack {
                    DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                    DayForecast(day: "San", isRainy: false, high: 90, low: 30)
                    DayForecast(day: "Thu", isRainy: true, high: 30, low: 10)
                }
            }

            WeekForecast(dateRange: "Mon - Thu:")
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
    
    var temperatureColor: Color {
        if high > 80 {
            return .red
        } else {
            return .primary
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
            Text("High: \(high)ºF")
                .fontWeight(.semibold)
                .foregroundStyle(temperatureColor)
            Text("Low: \(low)ºF")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let dateRange: String
    
    var averageLow: Int {
        return (50 + 40 + 30 + 10) / 4
    }

    var averageHigh: Int {
       return (70 + 60 + 90 + 30) / 4
    }
    
    var numberOfSunDays: Int {
        return 2
    }
    
    var numberOfRainDays: Int {
        return 2
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(dateRange)
                .font(.largeTitle)
            Text("Average Low: \(averageLow)ºF")
                .font(.title2)
                .foregroundStyle(.secondary)
            Text("Average High: \(averageHigh)ºF")
                .font(.title2)
                .foregroundStyle(.secondary)
            Text("Number of Sun Days: \(numberOfSunDays)")
                .font(.title2)
                .foregroundStyle(.secondary)
            Text("Number of Rain Days: \(numberOfRainDays)")
                .font(.title2)
                .foregroundStyle(.secondary)
        }
    }
}
