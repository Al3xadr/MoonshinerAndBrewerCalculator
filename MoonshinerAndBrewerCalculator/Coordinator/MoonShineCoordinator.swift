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
        moonShineViewController.coordinator = self
        navigationController.pushViewController(moonShineViewController, animated: true)
    }
    func showCalculationScreen(for calculation: CalculationItem) {
        let vc = calculation.viewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
