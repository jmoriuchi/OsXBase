//
//  Log.swift
//  OsXBase
//
//  Created by Junichi Moriuchi on 2016/08/07.
//
//

import Cocoa

/**

 The Log class represents a log entity.
 
 A Log class instance having its own file provides methods to write messages.
 
 You can give instances an instruction of whether opening the log with append mode when the instances is created.
 */

class Log: NSObject {
    
    /// The log file path.
    let filePath: String
    
    /// The log file opening option being true if append mode.
    let isAppendMode: Bool
    
    /// The output stream of the log file.
    var fileStream: NSOutputStream?
    
    /// The latest message.
    var message = ""
    
    /**
     Creates an instance, and then executes initialization for the instance.
     
     The log file of the instance is opened at the same time.
     
     - parameter filePath:  The file path of its own file.
     - parameter isAppendMode: A file opening option being true if append mode.
     
     - returns: The created instance if succeeded, nil otherwise.
     */
    init?(filePath: String, isAppendMode: Bool) {
        
        //  Stores the file path and the file opening option.
        self.filePath = filePath
        self.isAppendMode = isAppendMode
        
        //  Executes the superclass initialization.
        super.init()
        
        //  Opens the log file of the instence.
        guard openFile() else {
            return nil
        }
    }
    
    /**
     Discards the Log class instance which has turned into unused after post-processing for the instance.
     
     The log file is closed at the same time.
     
     */
    deinit {
        
        //  Closes the log file.
        closeFile()
    }
    
    /**
     Opens a log file.
     
     A file stream is created using the log file path property and the log file opening option prpoerty.
     
     - returns: true if succeeded to open, false otherwise.
     */
    private func openFile() -> Bool {
        
        //  Create the log file stream with the log file path property and the log file opening option property.
        guard let stream = NSOutputStream(toFileAtPath: self.filePath, append: self.isAppendMode) else {
            print(MessageUtility.errorMessage("Failed to initialize NSOutputStream", details: "path = [\(self.filePath)]"))
            return false
        }
        //  Opens the log file.
        stream.open()
        guard stream.streamError == nil else {
            print(MessageUtility.errorMessage("Failed to open a log file stream", details: "path = [\(self.filePath)]"))
            return false
        }
        //  Stores the log file stream instance as a property.
        self.fileStream = stream
        return true
    }
    
    /**
     Closes the log file.
     */
    private func closeFile() {
        
        //  Closes the log file stream if the stream has been created.
        if let stream = self.fileStream {
            stream.close()
            self.fileStream = nil
        }
    }
    
    /**
     Writes the given message into the log.
     
     - parameter message: A message to be logged.
     */
    func writeMessage(message: String) {
        self.message = ""
        
        //  Does nothing if the log file steam has not been created.
        guard let stream = self.fileStream else {
            return
        }
        //  Writes the given message using the log format.
        let logMessage = MessageUtility.logMessage(message)
        guard stream.write(logMessage, maxLength: logMessage.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)) >= 0 else {
            
            //  Closes the log file since failed to write the message.
            print(MessageUtility.errorMessage("Failed to write a message"))
            closeFile()
            return
        }
        //  Stores the latest message.
        self.message = message
    }
}
