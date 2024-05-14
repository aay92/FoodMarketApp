import UIKit

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    private let userStorage = UserStorage.shared

   //MARK: - Properties
    weak var coordinator: OnBoardingCoordinator!
    
    init(coordinator: OnBoardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}
