import UIKit

class AppCoordinator: Coordinator {
    override func start() {
        showOnBoardingFlow()
//        showMainFlow()
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
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(
            type: .home,
            navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(
            title: "Home", image: UIImage(systemName: "sun.max.fill"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let orderNavigationController = UINavigationController()
        let orderCoordinator = OrderCoordinator(
            type: .order,
            navigationController: orderNavigationController)
        orderNavigationController.tabBarItem = UITabBarItem(
            title: "Order", image: UIImage(systemName: "sun.max.fill"), tag: 1)
        orderCoordinator.finishDelegate = self
        orderCoordinator.start()
        
        let listNavigationController = UINavigationController()
        let listCoordinator = ListCoordinator(
            type: .list,
            navigationController: listNavigationController)
        listNavigationController.tabBarItem = UITabBarItem(
            title: "List", image: UIImage(systemName: "sun.max.fill"), tag: 2)
        listCoordinator.finishDelegate = self
        listCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(
            type: .profile,
            navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(
            title: "Profile", image: UIImage(systemName: "sun.max.fill"), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        [homeCoordinator,
         orderCoordinator,
         listCoordinator,
         profileCoordinator]
            .forEach(addChildCoordinator(childCoordinator:))
        
        let tabBatControllers = [
            homeNavigationController,
            orderNavigationController,
            listNavigationController,
            profileNavigationController]
        
        let tabBarController = TabBarController(
            tabBarControllers: tabBatControllers)
        
        navigationController.pushViewController(
            tabBarController, animated: true)
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
