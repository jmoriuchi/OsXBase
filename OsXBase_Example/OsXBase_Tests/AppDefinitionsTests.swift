//
//  AppDefinitionsTests.swift
//  OsXBase_Example
//
//  Created by Junichi Moriuchi on 2016/08/11.
//  Copyright © 2016年 Junichi Moriuchi. All rights reserved.
//

@testable import OsXBase

import Quick
import Nimble

class AppDefinitionsTests: QuickSpec {
    override func spec() {
        describe("The RootDirectory") {
            it("shows the Xcode directory"){
                expect(AppDefinitions.RootDirectory).to(match("\(NSHomeDirectory())/Documents/Xcode"))
            }
        }
        describe("The LogDirectory") {
            it("shows the Logs directory") {
                expect(AppDefinitions.LogDirectory).to(match("\(NSHomeDirectory())/Documents/Xcode/Logs"))
            }
        }
    }
    
}