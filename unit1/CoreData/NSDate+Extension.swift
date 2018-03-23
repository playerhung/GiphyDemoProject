//
//  NSDate+Extension.swift
//  unit1
//
//  Created by Hung Dinh on 3/23/18.
//  Copyright © 2018 Hung Dinh. All rights reserved.
//

import Foundation

extension NSDate {
    func convertToNSDate(timeMilisecond:Double) -> NSDate? {
        return NSDate(timeIntervalSinceReferenceDate: timeMilisecond)
    }
}
