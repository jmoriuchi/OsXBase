//
//  MessageUtilityTests.swift
//  OsXBase_Example
//
//  Created by Junichi Moriuchi on 2016/08/07.
//  Copyright © 2016年 Junichi Moriuchi. All rights reserved.
//

import XCTest

@testable import OsXBase

import Quick
import Nimble

class MessageUtilityTests: QuickSpec {
    override func spec() {
        describe("currentDateString method") {
            it("returns the formatted current date and time string"){
                let current = MessageUtility.currentDateString()
                
                let date = NSDateFormatter()
                date.locale = NSLocale(localeIdentifier: "ja_JP")
                date.dateFormat = "yyyy-MM-dd"
                let today = date.stringFromDate(NSDate())
                expect(current).to(equal(today))
            }
        }
        
    }
    
}