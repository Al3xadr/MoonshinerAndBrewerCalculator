import UIKit

final class SavedRecipesCoordinator: Coordinator {
    private let container: DependencyContainer
    var navigationController: UINavigationController
    
    init(container: DependencyContainer, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        let savedRecipesViewController = container.savedRecipesViewController
        navigationController.pushViewController(savedRecipesViewController, animated: true)
    }
    
    
}
