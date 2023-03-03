
import RxFlow
import UIKit
import Then

class SignInFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init() {
        
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? PaperStep else {return .none}
        switch step {
        case .introIsRequired:
            return self.coordinateToIntro()
        case .signInIsRequired:
            return self.
        case .signUpIsRequired:
            <#code#>
        case .mainIsRequired:
            <#code#>
        }
    }
    
    private func coordinateToIntro() -> FlowContributors {
        let vm = IntroVM()
        let vc = IntroVC(vm)
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
}
