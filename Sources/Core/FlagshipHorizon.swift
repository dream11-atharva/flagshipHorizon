import Foundation

// MARK: - Configuration
public struct FlagshipHorizonConfig {
    public let apiKey: String
    public let baseURL: URL
    public let cacheExpiry: TimeInterval
    public let timeout: TimeInterval
    
    public init(apiKey: String, baseURL: URL = URL(string: "https://api.flagshiphorizon.com")!, cacheExpiry: TimeInterval = 300, timeout: TimeInterval = 30) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        self.cacheExpiry = cacheExpiry
        self.timeout = timeout
    }
}

// MARK: - Flag Value Types
public enum FlagValue {
    case boolean(Bool)
    case string(String)
    case integer(Int)
    case double(Double)
    case object([String: Any])
}

// MARK: - Main SDK Class
public class FlagshipHorizon {
    
    public static let shared = FlagshipHorizon()
    
    // MARK: - Properties
    private var config: FlagshipHorizonConfig?
    private var flags: [String: FlagValue] = [:]
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Configuration
    public func configure(with config: FlagshipHorizonConfig) {
        self.config = config
        setupHardcodedFlags()
    }
    
    // MARK: - Hardcoded Flags Setup
    private func setupHardcodedFlags() {
        // Boolean flags
        setFlag(key: "new_feature_enabled", value: .boolean(true))
        setFlag(key: "dark_mode_enabled", value: .boolean(false))
        setFlag(key: "premium_user", value: .boolean(true))
        
        // String flags
        setFlag(key: "welcome_message", value: .string("Welcome to Flagship Horizon!!!!!!"))
        setFlag(key: "api_version", value: .string("v2.1"))
        setFlag(key: "theme_color", value: .string("blue"))
        
        // Integer flags
        setFlag(key: "max_retries", value: .integer(3))
        setFlag(key: "cache_size", value: .integer(100))
        setFlag(key: "timeout_seconds", value: .integer(30))
        
        // Double flags
        setFlag(key: "discount_rate", value: .double(0.15))
        setFlag(key: "performance_threshold", value: .double(0.95))
        
    }
    
    // MARK: - Flag Evaluation Methods
    public func getBooleanFlag(key: String, defaultValue: Bool) -> Bool {
        if let flagValue = flags[key], case .boolean(let value) = flagValue {
            return value
        }
        return defaultValue
    }
    
    public func getStringFlag(key: String, defaultValue: String) -> String {
        if let flagValue = flags[key], case .string(let value) = flagValue {
            return value
        }
        return defaultValue
    }
    
    public func getIntegerFlag(key: String, defaultValue: Int) -> Int {
        if let flagValue = flags[key], case .integer(let value) = flagValue {
            return value
        }
        return defaultValue
    }
    
    public func getDoubleFlag(key: String, defaultValue: Double) -> Double {
        if let flagValue = flags[key], case .double(let value) = flagValue {
            return value
        }
        return defaultValue
    }
    
    // MARK: - Flag Management
    public func setFlag(key: String, value: FlagValue) {
        flags[key] = value
    }
    
    public func clearFlags() {
        flags.removeAll()
    }
    
    // MARK: - Test Method
    public func testFlags() {
        print("++++++ Testing flags directly in core:")
        print("++++++ new_feature_enabled: \(getBooleanFlag(key: "new_feature_enabled", defaultValue: false))")
        print("++++++ welcome_message: \(getStringFlag(key: "welcome_message", defaultValue: "default"))")
        print("++++++ max_retries: \(getIntegerFlag(key: "max_retries", defaultValue: 0))")
        print("++++++ discount_rate: \(getDoubleFlag(key: "discount_rate", defaultValue: 0.0))")
    }
    
    // MARK: - Legacy Method (for backward compatibility)
    public func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
}
