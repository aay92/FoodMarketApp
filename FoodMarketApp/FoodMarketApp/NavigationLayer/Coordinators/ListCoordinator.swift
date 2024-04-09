import UIKit

class ListCoordinator: Coordinator {
    override func start() {
       let vc = ViewController()
        vc.view.backgroundColor = .blue
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("appCoordinator finish")
    }
}
