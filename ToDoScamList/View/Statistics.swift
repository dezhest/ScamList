//
//  Statistics.swift
//  ToDoScamList
//
//  Created by Denis Zhesterev on 26.01.2023.
//

import SwiftUI
import SwiftUICharts

struct Statistics: View {
    @Binding var type: String
    @Binding var allPower: Double
    @Binding var averagePowerOfAll: Double
    @Binding var averagePowerSameType: Double
    @Binding var averagePowerOfLast30day: Double
    @Binding var mostFrequentTypeCount: Int
    @Binding var mostFrequentType: String
    @Binding var sameTypeCount: Int
    @Binding var last30dayPower: Int
    @Binding var last30daySameTypeCount: Int
    @Binding var currentWeekSameTypeCount: Int
    @Binding var currentWeekPower: Int
    @Binding var previosOneWeekPower: Int
    @Binding var previosTwoWeekPower: Int
    @Binding var previosThreeWeekPower: Int
    @Binding var previosFourWeekPower: Int
    @Binding var previosFiveWeekPower: Int
    @Binding var eachTypeCount: [Int]
    @Binding var allTypes: [String]
    @State private var statistic = false
    @State private var general = false
    @State private var month = false
    @State private var week = false
    @Environment(\.dismiss) var dismiss
    let today = Date.today().getFormattedDate(format: "dd/MM")
    let lastSunday = Date.today().previous(.sunday).getFormattedDate(format: "dd/MM")
    let previosOneSunday = Date.today().previous(.sunday).previous(.sunday).getFormattedDate(format: "dd/MM")
    let previosTwoSunday = Date.today().previous(.sunday).previous(.sunday).previous(.sunday).getFormattedDate(format: "dd/MM")
    let previosThreeSunday = Date.today().previous(.sunday).previous(.sunday).previous(.sunday).previous(.sunday).getFormattedDate(format: "dd/MM")
    let previosFourSunday = Date.today().previous(.sunday).previous(.sunday).previous(.sunday).previous(.sunday).previous(.sunday).getFormattedDate(format: "dd/MM")
    let previosFiveSunday = Date.today().previous(.sunday).previous(.sunday).previous(.sunday).previous(.sunday).previous(.sunday).previous(.sunday).getFormattedDate(format: "dd/MM")
    let lastMonday = Date.today().previous(.monday).getFormattedDate(format: "dd/MM")
    let previosOneWeekMonday = ContentView().previosOneWeek.getFormattedDate(format: "dd/MM")
    let previosTwoWeekMonday = ContentView().previosTwoWeek.getFormattedDate(format: "dd/MM")
    let previosThreeWeekMonday = ContentView().previosThreeWeek.getFormattedDate(format: "dd/MM")
    let previosFourWeekMonday = ContentView().previosFourWeek.getFormattedDate(format: "dd/MM")
    let previosFiveWeekMonday = ContentView().previosFiveWeek.getFormattedDate(format: "dd/MM")
    let screenSize = UIScreen.main.bounds
    let pieChartStyle = ChartStyle(backgroundColor: .black, accentColor: .orange, gradientColor: GradientColor(start: .orange, end: .red), textColor: .white, legendTextColor: .white, dropShadowColor: .gray)
    func findPieChartData() -> [PieChartData] {
        var pieChartData = [PieChartData]()
        var item = 0
        repeat {
            pieChartData.append(PieChartData(label: allTypes[item], value: Double(eachTypeCount[item])))
            item += 1
        }
        while allTypes.count > item
                return pieChartData
    }
    var body: some View {
        Text(type)
        List {
            HStack {
                Group {
                    Text("Количество скамов типа ")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .font(.system(size: 14, weight: .medium, design: .default))
                    + Text("#\(type)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.orange)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    Text("\(sameTypeCount)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(7)
                        .background(Color(.orange))
                        .cornerRadius(20)
                        .padding(.bottom, 3)
                }
                .frame(alignment: .trailing)
            }
            HStack {
                Group {
                    Text("Средняя сила типа ")
                        .font(.system(size: 18, weight: .bold, design: .default))
                    + Text("#\(type)")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.orange)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    Text(String(format: "%.2f", averagePowerSameType))
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(7)
                        .background(Color(.orange))
                        .cornerRadius(20)
                        .padding(.bottom, 3)
                }
                .frame(alignment: .trailing)
            }
            DisclosureGroup(isExpanded: $general, content: {
                ZStack {
                    Text("Общая сила скама")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("\(Int(allPower))")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                ZStack {
                    Text("Средняя сила")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text(String(format: "%.2f", averagePowerOfAll))
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                ZStack {
                    VStack(alignment: .leading, spacing: 60) {
                        Text("Самый популярный тип:")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .padding(0)
                        Text("Встречается")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .padding(0)
                            .offset(y: -7)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text(mostFrequentType)
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(y: 22.5)
                        Text("\(mostFrequentTypeCount)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                            .frame(maxWidth: .infinity, maxHeight: 80, alignment: .bottomTrailing)
                    }
                }
            }, label: {Text("За все время").font(.system(size: 18, weight: .bold, design: .default))})
            DisclosureGroup(isExpanded: $month, content: {
                ZStack {
                    Text("Общая сила")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("\(last30dayPower)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Group {
                        Text("Количество скамов типа ")
                            .font(.system(size: 14, weight: .medium, design: .default))
                        + Text("#\(type)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.orange)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("\(last30daySameTypeCount)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(alignment: .trailing)
                }
                ZStack {
                    Text("Средняя сила")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text(String(format: "%.2f", averagePowerOfLast30day))
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }, label: {Text("За месяц").font(.system(size: 18, weight: .bold, design: .default))})
            DisclosureGroup(isExpanded: $week, content: {
                ZStack {
                    Text("Общая сила")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("\(currentWeekPower)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                HStack {
                    Group {
                        Text("Количество скамов типа ")
                            .font(.system(size: 14, weight: .medium, design: .default))
                        + Text("#\(type)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.orange)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("\(currentWeekSameTypeCount)")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(.white)
                            .padding(7)
                            .background(Color(.orange))
                            .cornerRadius(20)
                            .padding(.bottom, 3)
                    }
                    .frame(alignment: .trailing)
                }
            }, label: {Text("Текущая неделя").font(.system(size: 18, weight: .bold, design: .default))})
            VStack {
                BarChartView(data: ChartData(values: [("\(previosFiveWeekMonday) - \(previosFourSunday)", Double(previosFiveWeekPower)), ("\(previosFourWeekMonday) - \(previosThreeSunday)", Double(previosFourWeekPower)), ("\(previosThreeWeekMonday) - \(previosTwoSunday)", Double(previosThreeWeekPower)), ("\(previosTwoWeekMonday) - \(previosOneSunday)", Double(previosTwoWeekPower)), ("\(previosOneWeekMonday) - \(lastSunday)", Double(previosOneWeekPower)), ("\(lastMonday) - \(today)", Double(currentWeekPower))]), title: "Общая сила", legend: "за последние недели", style: Styles.barChartStyleOrangeLight, form: CGSize(width: screenSize.width * 0.8, height: 200))
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .bottom)
                PieChartView(data: findPieChartData(), title: "Типы скамов", style: pieChartStyle, form: CGSize(width: screenSize.width * 0.8, height: 300))
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .bottom)
            }

        }
    }
}

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics(type: .constant(""), allPower: .constant(0.0), averagePowerOfAll: .constant(0.0), averagePowerSameType: .constant(0.0), averagePowerOfLast30day: .constant(0.0), mostFrequentTypeCount: .constant(0), mostFrequentType: .constant(""), sameTypeCount: .constant(0), last30dayPower: .constant(0), last30daySameTypeCount: .constant(0), currentWeekSameTypeCount: .constant(0), currentWeekPower: .constant(0), previosOneWeekPower: .constant(0), previosTwoWeekPower: .constant(0), previosThreeWeekPower: .constant(0), previosFourWeekPower: .constant(0), previosFiveWeekPower: .constant(0), eachTypeCount: .constant([0]), allTypes: .constant([""]))
    }
}