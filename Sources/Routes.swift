//
//  Routes.swift
//  
//
//  Created by Joshua Davis on 2/27/24.
//

import Sailboat
import JavaScriptKit
import SailorWeb

public protocol RouteValue: CustomStringConvertible { }

extension String: RouteValue { }

//public protocol Routes: RouteValue, Equatable, Hashable {
////    static var getRoot: Self { get }
//    var description: String  { get }
//
//    // TODO: consider changing to v
//    static var defaultRoute: Self { get }
//    
//    static var bindings: BidirectionalDictionary<Self, String> { get }
//        
//    static func fromString(_ str: String) -> Self
//    
//}
//
//public extension Routes {
//    var description: String {
//        Self.bindings[key: self] ?? Self.bindings[key: Self.defaultRoute] ?? ""
//    }
//    
//    static func fromString(_ str: String) -> Self {
//        bindings[value: str] ?? .defaultRoute
//    }
//}

public final class Navigator {
    @Published public static var url: String = getUrl()
    
    private static func getUrl() -> String {
        let window = JSObject.global.window
        return window.location.object!.href.string!
    }
    
    private static func buildRoute(_ route: any RouteValue) -> String {
        if route.description == "/" {
            return "/"
        }

        return "/\(route.description)"
    }
    
//    MyRoute
    public static func go(to route: any RouteValue) {
        let window = JSObject.global.window
        let history = window.history.object!

        // Define the new URL you want to navigate to
        let newUrl = Self.buildRoute(route)

        // Create an empty JavaScript object for the state
        let stateObject = JSObject.global.Object.function!.new()

        // Define the title (even though browsers currently ignore this parameter)
        let title = JSValue.string("")

        // Directly call `pushState` with the arguments
        history.pushState?(stateObject, title, JSValue.string(newUrl))
        
        Self.url = getUrl()
        
    }
}
