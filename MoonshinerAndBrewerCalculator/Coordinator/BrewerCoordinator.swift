import UIKit

final class BrewerCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let container: DependencyContainer
    
    init(container: DependencyContainer, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        let brewerViewController = container.brewerViewController
        navigationController.pushViewController(brewerViewController, animated: true)
    }
    
    
}
