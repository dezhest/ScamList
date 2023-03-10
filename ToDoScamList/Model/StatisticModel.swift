//
//  StatisticModel.swift
//  ToDoScamList
//
//  Created by Denis Zhesterev on 21.02.2023.
//

import Foundation

struct StatisticModel {
    var statistic = false
    var general = false
    var month = false
    var week = false
    
    var id: ObjectIdentifier = ObjectIdentifier(AnyObject.self)
    var type: String = ""
    var allPower: Double = 0.0
    var averagePowerOfAll: Double = 0.0
    var averagePowerSameType: Double = 0.0
    var mostFrequentTypeCount: Int = 0
    var mostFrequentType: String = ""
    var sameTypeCount: Int = 0
    var last30dayPower: Int = 0
    var last30daySameTypeCount: Int = 0
    var averagePowerOfLast30day: Double = 0.0
    var currentWeekSameTypeCount: Int = 0
    var currentWeekPower: Int = 0
    var oneWeekAgoPower: Int = 0
    var twoWeeksAgoPower: Int = 0
    var threeWeeksAgoPower: Int = 0
    var fourWeeksAgoPower: Int = 0
    var fiveWeeksAgoPower: Int = 0
    var eachTypeCount: [Int] = []
    var allTypes: [String] = []
    
    let today = Date.todayDate
    let lastSunday = Date.lastSunday
    let oneSundayAgo = Date.oneSundayAgo
    let twoSundayAgo = Date.twoSundayAgo
    let threeSundayAgo = Date.threeSundayAgo
    let fourSundayAgo = Date.fourSundayAgo
    let fiveSundayAgo = Date.fiveSundayAgo
    let lastMonday = Date.lastMonday
    let oneMondayAgo = Date.oneWeekAgoDate.getFormattedDate(format: "dd/MM")
    let twoMondayAgo = Date.twoWeeksAgoDate.getFormattedDate(format: "dd/MM")
    let threeMondayAgo = Date.threeWeeksAgoDate.getFormattedDate(format: "dd/MM")
    let fourMondayAgo = Date.fourWeeksAgoDate.getFormattedDate(format: "dd/MM")
    let fiveMondayAgo = Date.fiveWeeksAgoDate.getFormattedDate(format: "dd/MM")
}
