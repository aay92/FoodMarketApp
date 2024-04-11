import UIKit

class OnBoardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("appCoordinator finish")
    }
}

private extension OnBoardingCoordinator {
    func showOnboarding(){
        var pages = [UIViewController]()
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .purple
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .yellow
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .green
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)

        let presenter = OnboardingViewPresenter(
            coordinator: self)
        let vc = OnboardingViewController( pages: pages,
            viewOutput: presenter)
         navigationController?.pushViewController(
            vc, animated: true)
    }
}
