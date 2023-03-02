import RxFlow
import AppKit
import RxSwift
import RxCocoa

struct AppStepper: Stepper {
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    
    init() {}
    
    var initialStep: Step {
        return PaperStep.signInIsRequired
    }
}

final class AppFlow: Flow {
    private var rootViewController = NSViewController()
    
    var root: Presentable {
        return self.rootViewController
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? PaperStep else {return .none}
        
        switch step {
        case .signInIsRequired:
            return coordinateToSignIn()
        default:
            return .none
        }
    }
    
    private func coordinateToSignIn() -> FlowContributors {
        let flow = LoginFlow()
        Flows.use(flow, when: .created) { (root) in
            self.rootViewController = root as! NSViewController
        }
        return .one(
            flowContributor: .contribute(
                withNextPresentable: flow,
                withNextStepper: OneStepper(withSingleStep: SCStep.loginIsRequired)
        ))
    }
    
}
