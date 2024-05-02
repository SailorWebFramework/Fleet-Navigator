import Sailboat
import Sailor

public struct Router: Fragment {
    public var hash: String
    public var children: [any Page]
                
    public init(
        @RouteBuilder _ routes: @escaping () -> [Route],
        @PageBuilder notFound: @escaping () -> any Fragment
    ) {
        
        self.children = []
        self.hash = ""
        
        let routes = routes()
                
        for route in routes {
            if route.isActive {
                self.children.append(contentsOf: route.children)
                self.hash += route.hash
            }
        }
        
        if self.children.isEmpty {
            self.children = notFound().children
        }
        
        // register the url state for the Router
        _ = Navigator.url
        
    }
    
}
