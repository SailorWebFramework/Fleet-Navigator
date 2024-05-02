//
//  File.swift
//  
//
//  Created by Joshua Davis on 2/13/24.
//

// TODO: expose JSNode? remove testable?
@testable import SailorWeb

internal enum RouterUtils {
    
    public static var url: String {
        JSNode.window.location.object!.href.string!
    }
    
    public static func parseAndVerify(path: String) -> Bool {
        return Self.cleanPath(path: url) == path
    }
    
    public static func currentRoute() -> any RouteValue {
        return Self.cleanPath(path: url)
    }

    public static func cleanPath(path: String) -> String {
        let tmp = path.split(separator: "/")

        var cleaned = tmp.dropFirst(2).joined(separator: "")
        
        if cleaned.first == "#" {
            cleaned = ""
        } else if let beforeHashes = cleaned.split(separator: "#").first {
            cleaned = String(beforeHashes)
        }
        
        if cleaned == "" {
            return "/"
        }
        return cleaned
    }
}
