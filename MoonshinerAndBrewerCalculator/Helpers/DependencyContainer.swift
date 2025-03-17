import UIKit
final class DependencyContainer {
    //MARK: - ViewController
    var tabBarController: TabBarController {
        TabBarController(
            moonShineCoordinator: moonShineCoordinator,
            brewerCoordinator: brewerCoordinator,  // Исправлено
            recipesCoordinator: recipesCoordinator,
            savedRecipesCoordinator: savedRecipesCoordinator
        )
    }

    var moonShineViewController: MoonShineViewController {
        MoonShineViewController()
    }
    
    var brewerViewController: BrewerViewController {
        BrewerViewController()
    }
    
    var recipesViewController: RecipesViewController {
        RecipesViewController()
    }
    
    var savedRecipesViewController: SavedRecipesViewController {
        SavedRecipesViewController()
    }
    //MARK: - Coordinator
    var moonShineCoordinator: MoonShineCoordinator {
        MoonShineCoordinator(container: self, navigationController: UINavigationController())
    }

    var brewerCoordinator: BrewerCoordinator {
        BrewerCoordinator(container: self, navigationController: UINavigationController())
    }

    var recipesCoordinator: RecipesCoordinator {
        RecipesCoordinator(container: self, navigationController: UINavigationController())
    }

    var savedRecipesCoordinator: SavedRecipesCoordinator {
        SavedRecipesCoordinator(container: self, navigationController: UINavigationController())
    }
}
