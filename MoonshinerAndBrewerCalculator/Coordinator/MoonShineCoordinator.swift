import UIKit

final class MoonShineCoordinator: Coordinator {
    private let container: DependencyContainer
    
    var navigationController: UINavigationController
    
    init(container: DependencyContainer, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    func start() {
        let moonShineViewController = container.moonShineViewController
        navigationController.pushViewController(moonShineViewController, animated: true)
    }
    
    
}
