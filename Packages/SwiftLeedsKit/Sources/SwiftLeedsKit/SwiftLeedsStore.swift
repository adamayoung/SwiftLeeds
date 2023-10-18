import Foundation

public typealias SwiftLeedsStore = Store<SwiftLeedsState, SwiftLeedsAction, SwiftLeedsDependencies>

extension SwiftLeedsStore {

    public convenience init(
        state: SwiftLeedsState = SwiftLeedsState()
    ) {
        self.init(
            state: state,
            dependencies: SwiftLeedsLiveDependencies()
        )
    }

    convenience init(
        state: SwiftLeedsState = SwiftLeedsState(),
        dependencies: SwiftLeedsDependencies = SwiftLeedsLiveDependencies()
    ) {
        self.init(
            state: state,
            reduce: swiftLeedsReducer,
            intercept: swiftLeedsInterceptor,
            dependencies: dependencies
        )
    }

}

extension SwiftLeedsStore {

    public static var preview: SwiftLeedsStore {
        .init(
            state: .preview,
            reduce: { state, _ in
                state
            },
            intercept: { _, _, _ in
                nil
            },
            dependencies: SwiftLeedsLiveDependencies()
        )
    }

}
