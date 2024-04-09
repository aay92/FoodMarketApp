import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnBoardingFlow()
    }
    
    override func finish() {
        print("appCoordinator finish")
    }
}

//MARK: - Navigation methods
private extension AppCoordinator {
    func showOnBoardingFlow(){
        guard let navigationController = navigationController else { return }
        let onBoardingCoordinator = OnBoardingCoordinator(
            type: .onboarding,
            navigationController: navigationController,
            finishDelegate: self)
        addChildCoordinator(childCoordinator: onBoardingCoordinator)
        onBoardingCoordinator.start()
    }
    
    func showMainFlow(){
        
    }
}

extension AppCoordinator:CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinators: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator: childCoordinators)
        switch childCoordinators.type {
            
        case .app:
            return
        case .onboarding:
            navigationController?.popViewController(
                animated: false)
        case .home:
            break
        case .order:
            break
        case .list:
            break
        case .profile:
            break
        }
    }
}
