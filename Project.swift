import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Paper-p"
let orginazationIden = "Paper-p.Paper-p"

let project = Project.executable(
    name: projectName,
    platform: .macOS,
    packages: [
        .Then,
        .SnapKit,
        .Alamofire,
        .Moya,
        .RxSwift,
        .KeychainSwift
    ],
    product: .app,
    deploymentTarget: .macOS(targetVersion: "12.3"),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.Alamofire,
        .SPM.RxMoya,
        .SPM.RxSwift,
        .SPM.KeychainSwift
    ]
)
