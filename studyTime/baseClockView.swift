//
//  baseClockView.swift
//  studyTime
//
//  Created by Михаил Куприянов on 15.04.2023.
//
// в круге 360 градусов, 360 / 60 = 1 деление секунд/минут = 6 градусам
// чтобы показать 15 секун, мы умножаем секунды на 6 градусов 30 * 6 = 180
// чтобы показать 45 минут, мы умножаем минуты на 6 градусов 45 * 6 = 270,
// сдвинем по секундам минутную, нам надо к минутным градусам добавить секундные, 1 деление = 6 градусов, 270 + 6 = 276,
// 45м + 6(60 секунд) = 46м, получается секунды надо делить на 10, у нас бывает максимум 59 сек и мин, на проблему меньше
// часы, их 12, 360 * 12 = 30, чтобы показать часы умножаем 12 * 30 = 360
// сдвинем с поправкой на минуты, 1 час 30 градусов, 30 / 60 = 1 / 2, поэтому минуты поделим на 2 или 15 градусов = 30 минут
// 12 * 30 + 30 / 2

import SwiftUI

struct Time {
    var sec: Int
    var min: Int
    var hour: Int
}

struct baseClockView: View {
    var time = Time(sec: 30, min: 15, hour: 09)
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
                    .frame(width: 2, height: (wight - 140) / 2)
                    .offset(y: -(wight - 140) / 4)
                    .rotationEffect(.init(degrees: Double(time.sec) * 6))
                Rectangle()
                    .fill(.primary)
                    .frame(width: 4, height: (wight - 180) / 2)
                    .offset(y: -(wight - 180) / 4)
//                    .rotationEffect(.init(degrees: Double(time.min) * 6))
                    .rotationEffect(.init(degrees: Double(time.min * 6 + time.sec / 10)))
                Rectangle()
                    .fill(.primary)
                    .frame(width: 6, height: (wight - 220) / 2)
                    .offset(y: -(wight - 220) / 4)
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
