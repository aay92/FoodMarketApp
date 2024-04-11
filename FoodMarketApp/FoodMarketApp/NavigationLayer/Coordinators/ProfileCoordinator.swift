import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("appCoordinator finish")
    }
}
