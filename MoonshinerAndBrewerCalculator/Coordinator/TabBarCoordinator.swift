import UIKit


final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let container: DependencyContainer
    private let tabBarController: TabBarController
    private let moonShineCoordinator: MoonShineCoordinator
    private let recipesCoordinator: RecipesCoordinator
    private let savedRecipesCoordinator: SavedRecipesCoordinator
    private let brewerCoordinator: BrewerCoordinator

    init(navigationController: UINavigationController, container: DependencyContainer) {
        self.navigationController = navigationController
        self.container = container

        self.moonShineCoordinator = MoonShineCoordinator(container: container, navigationController: navigationController)
        self.brewerCoordinator = BrewerCoordinator(container: container, navigationController: navigationController)
        self.recipesCoordinator = RecipesCoordinator(container: container, navigationController: navigationController)
        self.savedRecipesCoordinator = SavedRecipesCoordinator(container: container, navigationController: navigationController)
        

        self.tabBarController = TabBarController(
            moonShineCoordinator: moonShineCoordinator,
            brewerCoordinator: brewerCoordinator,
            recipesCoordinator: recipesCoordinator,
            savedRecipesCoordinator: savedRecipesCoordinator
            
        )
    }

    func start() {
        navigationController.setViewControllers([tabBarController], animated: false)
    }
}

