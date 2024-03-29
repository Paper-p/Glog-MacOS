import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Paper-p"
let orginazationIden = "Paper-p.Paper-p"

let project = Project.executable(
    name: projectName,
    platform: .iOS,
    packages: [
        .Then,
        .SnapKit,
        .Alamofire,
        .Moya,
        .RxSwift,
        .KeychainSwift,
        .RxFlow
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.Alamofire,
        .SPM.RxMoya,
        .SPM.RxSwift,
        .SPM.KeychainSwift,
        .SPM.RxFlow
    ]
)
