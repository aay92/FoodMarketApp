import UIKit

class OnBoardingCoordinator: Coordinator {
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("appCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinators: self)
    }
}

private extension OnBoardingCoordinator {
    func showOnboarding(){
        var pages = [OnBoardingPartViewController]()

        
        let firstVC = OnBoardingPartViewController()
        firstVC.image = UIImage(resource: .chicken1)
        firstVC.titleText = "Delicious Food"
        firstVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        firstVC.buttonText = "Next"

        let secondVC = OnBoardingPartViewController()
        secondVC.image = UIImage(resource: .shipped2)
        secondVC.titleText = "Fast Shipping"
        secondVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        secondVC.buttonText = "Next"

        let thirdVC = OnBoardingPartViewController()
        thirdVC.image = UIImage(resource: .medal3)
        thirdVC.titleText = "Certificate Food"
        thirdVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        thirdVC.buttonText = "Next"
        
        let fourthVC = OnBoardingPartViewController()
        fourthVC.image = UIImage(resource: .creditCard4)
        fourthVC.titleText = "Payment Online"
        fourthVC.descriptionText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
        fourthVC.buttonText = "Cool!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)

        let presenter = OnboardingViewPresenter(
            coordinator: self)
        let vc = OnboardingViewController( pages: pages,
            viewOutput: presenter)
         navigationController?.pushViewController(
            vc, animated: true)
    }
}
