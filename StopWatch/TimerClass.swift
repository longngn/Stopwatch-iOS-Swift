//
//  TimerClass.swift
//  StopWatch
//
//  Created by Nguyen Le Vu Long on 12/24/16.
//  Copyright © 2016 Nguyen Le Vu Long. All rights reserved.
//

import Foundation

class customTimer {
    var startTime: TimeInterval?
    var currentTime: TimeInterval {
        return NSDate.timeIntervalSinceReferenceDate
    }
    var elapsedTime: TimeInterval {
        return currentTime - startTime!
    }
    var freezedTime: TimeInterval = 0.0
    var inString: String {
        let time = elapsedTime
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        let fraction = Int(time * 100) % 100
        let string = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds) + "," + String(format: "%02d", fraction)
        return string
    }
    
    func start() {
        if startTime == nil {
            startTime = currentTime
        } else {
            startTime = currentTime - freezedTime
        }
    }
    func reset() {
        startTime = nil
    }
    func pause() {
        freezedTime = elapsedTime
    }
}
