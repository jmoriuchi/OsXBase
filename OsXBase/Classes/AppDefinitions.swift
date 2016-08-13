//
//  AppDefinitions.swift
//  OsXBase
//
//  Created by Junichi Moriuchi on 2016/08/11.
//
//

import Cocoa

/**
 
 The AppDefinitions structure is a collection of definitions for an application.
 
 */

public struct AppDefinitions {
    
    //  The root directory of Xcode projects and logs.
    
    static var RootDirectory: String {
        return "\(NSHomeDirectory())/Documents/Xcode"
    }

    //  The application name.
    //  Each application should be set this property when it starts.
    static var AppName: String = ""
    
    //  The log directory.
    static var LogDirectory: String {
        return "\(self.RootDirectory)/Logs"
    }

}