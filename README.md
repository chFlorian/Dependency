# Dependency

A dependency Injection solution for SwiftUI. Based on a video by Antoine Van Der Lee and Vincent Pradeilles.

## Usage

### Register a Service as a Dependency

```swift
private struct UserServiceKey: DependencyKey {
    static var currentValue: UserService = MyUserService()
}

extension DependencyValues {
    var userService: UserService {
        get { Self[UserServiceKey.self] }
        set { Self[UserServiceKey.self] = newValue }
    }
}
```

### Access a Service, e.g. inside a ViewModel

```swift
@Dependency(\.userService) private var userService
```

### Set a Service, e.g. inside a Unit Test

```swift
DependencyValues[\.userService] = MockUserService()
```
