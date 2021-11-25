# Dependency

A dependency Injection solution for SwiftUI. 
Thank you [Antoine van der Lee](https://www.avanderlee.com/swift/dependency-injection/) and [Vincent Pradeilles](https://youtu.be/TLmBeqA53bo) for initially showcasing this idea.

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
