public protocol DependencyKey {
    associatedtype Value
    static var currentValue: Self.Value { get set }
}

public struct DependencyValues {
    private static var current = DependencyValues()
    
    public static subscript<K>(key: K.Type) -> K.Value where K: DependencyKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    public static subscript<T>(_ keyPath: WritableKeyPath<DependencyValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

@propertyWrapper
public struct Dependency<T> {
    private let keyPath: WritableKeyPath<DependencyValues, T>
    public var wrappedValue: T {
        get { DependencyValues[keyPath] }
        set { DependencyValues[keyPath] = newValue }
    }
    
    public init(_ keyPath: WritableKeyPath<DependencyValues, T>) {
        self.keyPath = keyPath
    }
}
