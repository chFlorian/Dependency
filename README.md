# Dependency

A dependency Injection solution for SwiftUI. Based on a video by Antoine Van Der Lee and Vincent Pradeilles.

## Usage

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
