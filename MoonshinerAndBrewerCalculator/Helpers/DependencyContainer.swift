import UIKit
final class DependencyContainer {
    
    private let calculationsProvider = CalculationsProvider()
    
    //MARK: - ViewController
    var tabBarController: TabBarController {
        TabBarController(
            moonShineCoordinator: moonShineCoordinator,
            brewerCoordinator: brewerCoordinator,
            recipesCoordinator: recipesCoordinator,
            savedRecipesCoordinator: savedRecipesCoordinator
        )
    }

    var moonShineViewController: MoonShineViewController {
        let vc = MoonShineViewController(calculationsProvider: calculationsProvider)
        vc.coordinator = moonShineCoordinator
        return vc
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
