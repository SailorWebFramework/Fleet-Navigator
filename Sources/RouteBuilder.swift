//
//  RouteBuilder.swift
//  
//
//  Created by Joshua Davis on 2/12/24.
//

import Sailboat

@resultBuilder
public struct RouteBuilder {
    public static func buildBlock(_ children: Route...) -> [Route] {
        return children

    }
}
