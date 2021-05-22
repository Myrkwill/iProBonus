import Foundation

@propertyWrapper
struct Storage<T: Codable> {

    private let key: String
    private let defaultValue: T
    private let storage: UserDefaults = .standard

    init(_ key: String, default defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            // Read value from UserDefaults
            guard let data = storage.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }

            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            // Convert newValue to data
            let data = try? JSONEncoder().encode(newValue)

            // Set value to UserDefaults
            storage.set(data, forKey: key)
        }
    }
    
}
