//
//  baseClockView.swift
//  studyTime
//
//  Created by Михаил Куприянов on 15.04.2023.

import SwiftUI

struct baseClockView: View {
    var time = Time(sec: 30, min: 15, hour: 12)
    var wight = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.primary)
                    .opacity(0.1)
                ForEach(0..<60) { second in
                    Rectangle()
                        .fill(.primary)
                        .frame(width: 3, height: (second % 5) == 0 ? 15 : 5)
                        .offset(y: (wight - 70) / 2)
                        .rotationEffect(.init(degrees: Double(second) * 6))
                }
                Rectangle()
                    .fill(.red)
                    .frame(width: 2, height: (wight - 110) / 2)
                    .offset(y: -(wight - 110) / 4)
                    .rotationEffect(.init(degrees: Double(time.sec) * 6))
                Rectangle()
                    .fill(.primary)
                    .frame(width: 4, height: (wight - 160) / 2)
                    .offset(y: -(wight - 160) / 4)
                    .rotationEffect(.init(degrees: Double(time.min * 6 + time.sec / 10)))
                Rectangle()
                    .fill(.primary)
                    .frame(width: 6, height: (wight - 210) / 2)
                    .offset(y: -(wight - 210) / 4)
                    .rotationEffect(.init(degrees: Double(time.hour * 30 + time.min / 2)))
                Circle()
                    .fill(.primary)
                    .frame(width: 15)
            }
            .padding()
        }
    }
}

struct baseClockView_Previews: PreviewProvider {
    static var previews: some View {
        baseClockView()
    }
}

struct Time {
    var sec: Int
    var min: Int
    var hour: Int
}
