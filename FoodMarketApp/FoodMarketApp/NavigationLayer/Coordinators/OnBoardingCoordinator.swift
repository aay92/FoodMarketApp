import UIKit

class OnBoardingCoordinator: Coordinator {
    override func start() {
       let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("appCoordinator finish")
    }
}
