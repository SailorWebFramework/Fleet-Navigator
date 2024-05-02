
import Sailor
import Sailboat

public struct Route: Fragment {
    public var hash: String
    
    public var children: [any Page]
        
    public var isActive: Bool {
        !children.isEmpty
    }
    
    let route: any RouteValue

    public init(_ route: any RouteValue, @PageBuilder _ builder: @escaping () -> any Fragment) {
        self.hash = route.description
        self.route = route
        
        // TODO: move to @Environment
        if route.description == RouterUtils.currentRoute().description {
            self.children = builder().children
        } else {
            self.children = []
        }
    }
    

}


