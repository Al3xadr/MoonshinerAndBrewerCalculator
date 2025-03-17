import UIKit

final class RecipesCoordinator: Coordinator {
    private let container: DependencyContainer
    var navigationController: UINavigationController
    
    init(container: DependencyContainer, navigationController: UINavigationController) {
        self.container = container
        self.navigationController = navigationController
    }
    
    func start() {
        let recipesViewController = container.recipesViewController
        navigationController.pushViewController(recipesViewController, animated: true)
    }
    
    
}
