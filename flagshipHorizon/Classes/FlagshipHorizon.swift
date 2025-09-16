import Foundation

public class FlagshipHorizon {
    
    public static let shared = FlagshipHorizon()
    
    private init() {}
    
    public func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}
