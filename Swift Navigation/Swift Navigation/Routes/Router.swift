import SwiftUI
import Combine

class Router: ObservableObject {
    @Published var path: [Route] = []
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        _ = path.popLast()
    }
    
    func reset() {
        path = []
    }
    
    func setRoot(_ route: Route) {
        path = [route]
    }
}
