//
//  LogMessageUtility.swift
//  Pods
//
//  Created by Junichi Moriuchi on 2016/08/07.
//
//

import Cocoa

/**
 
 The MessageUtility structure is a collection of methods returning formatted strings and messages.
 
 */

public struct MessageUtility {
    
    /**
     Returns a formatted current date string
     
     - returns: A formatted current date string.
     */
    public static func currentDateString() -> String {
        
        let date = NSDateFormatter()
        date.locale = NSLocale(localeIdentifier: "ja_JP")
        date.dateFormat = "yyyy-MM-dd"
        return date.stringFromDate(NSDate())
    }
    
    /**
     Returns a formatted current date and time string.
     
     - returns: A formatted current date and time stirng.
     */
    public static func currentDateTimeString() -> String {
        
        let date = NSDateFormatter()
        date.locale = NSLocale(localeIdentifier: "ja_JP")
        date.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return date.stringFromDate(NSDate())
    }
    
    /**
     Returns a formatted default log file directory string.
     
     - returns: A formatted default log file directroy stirng.
     */
    static func logDirectoryString() -> String {
        
        return "\(NSHomeDirectory())/Documents/Development/Logs"
    }
    
    /**
     Returns a formatted code location stirng.
     
     A formatted code location stirng includes information to specify a code line.
     All of information are given as paratemters.
     
     - parameter file:     The filename of the file where the code line is.
     - parameter line:     The line number of the code line.
     - parameter function: The function name of the function where the code line is. The function means a fucntion, a method or a property.
     
     - returns: A formatted code location string.
     */
    public static func codeLocationString(file file: String = #file, line: Int = #line, function: String = #function) -> String {
        
        let fileName = extractFileName(file)
        return "Function = \(function), Line = \(line), File = \(fileName)"
    }
    
    /**
     Returns a formatted error information string.
     
     A formatted error information stirng includes an error summary and an additional details description.
     
     - parameter error:  An error summary.
     - parameter detail: An additional details description.
     
     - returns: A formatted error information string.
     */
    public static func errorInfoString(error: String, details: String = "*") -> String {
        
        return "Error : \(error), Details : \(details)"
    }
    
    /**
     Returns a formatted log message.

     A formatted log message includes the current date and time, and a log message.
     
     - parameter message:  A log message.
     
     - returns: A formatted log message.
     */
    public static func logMessage(message: String) -> String {
        
        //  Gets the current date and time string.
        let dateTimeString = self.currentDateTimeString
        
        //  Returns a formatted log message.
        return "[\(dateTimeString)] \(message)\n"
    }
    
    /**
     Returns a formatted error message.
     
     A formatted error message includes as follows:
     - The current date and time.
     - An error information.
     - An error code location.
     
     - parameter error:    An error summary.
     - parameter detail:   A details description.
     - parameter file:     The filename of the file where the error code line is.
     - parameter line:     The line number of the error code line.
     - parameter function: The function name of the function where the error code line is.
     
     - returns: A formatted error message.
     */
    public static func errorMessage(error: String, details: String = "*", file: String = #file, line: Int = #line, function: String = #function) -> String {
        
        //  Gets a formatted error information string.
        let errorString = self.errorInfoString(error, details: details)
        
        //  Gets a formatted error code location string.
        let locationString = self.codeLocationString(file: file, line: line, function: function)
        
        //  Returns a formatted error message.
        return "\(errorString)\n    At \(locationString)"
    }
    
    /**
     Extracts the file name part from a file path
     
     - parameter filePath: The file path
     
     - returns: The file name part.
     */
    static func extractFileName(filePath: String) -> String {
        
        //  Separates the file path by '/'
        let pathArray = filePath.componentsSeparatedByString("/")
        if let fileName = pathArray.last {
            return fileName
        } else {
            return ""
        }
    }
    
}
