import PackageDescription

let package = Package(
    name: "RxTestProject",
    target:[],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", "4.0.0" ..< "5.0.0")
    ]
)
