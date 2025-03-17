import UIKit

final class TabBarController: UITabBarController {

    private let brewerCoordinator: BrewerCoordinator
    private let recipesCoordinator: RecipesCoordinator
    private let moonShineCoordinator: MoonShineCoordinator
    private let savedRecipesCoordinator: SavedRecipesCoordinator
    
    init(moonShineCoordinator: MoonShineCoordinator, brewerCoordinator: BrewerCoordinator, recipesCoordinator: RecipesCoordinator,  savedRecipesCoordinator: SavedRecipesCoordinator) {
        self.moonShineCoordinator = moonShineCoordinator
        self.brewerCoordinator = brewerCoordinator
        self.recipesCoordinator = recipesCoordinator
        self.savedRecipesCoordinator = savedRecipesCoordinator
        super.init(nibName: nil, bundle: nil) 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
    }
}

// MARK: - TabBar Setup
private extension TabBarController {
    func setupTabBar() {
        let floatingTabBar = FloatingTabBar()
        setValue(floatingTabBar, forKey: "tabBar")
        tabBar.tintColor = AppColors.activeElements
        tabBar.backgroundColor = AppColors.mainBackgroundColor
        tabBar.barTintColor = AppColors.mainBackgroundColor
        tabBar.unselectedItemTintColor = AppColors.inactiveElements
        tabBar.isTranslucent = true
    }

    func setupViewControllers() {
        moonShineCoordinator.start()
        brewerCoordinator.start()
        recipesCoordinator.start()
        savedRecipesCoordinator.start()
        
        moonShineCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "moon"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        brewerCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "b.circle"),
            selectedImage: UIImage(systemName: "handbag.fill")
        )
        
        recipesCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "list.bullet.clipboard"),
            selectedImage: UIImage(systemName: "handbag.fill"))
        
        savedRecipesCoordinator.navigationController.tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "square.and.arrow.down"),
            selectedImage: UIImage(systemName: "handbag.fill"))

        viewControllers = [
            moonShineCoordinator.navigationController,
            brewerCoordinator.navigationController,
            recipesCoordinator.navigationController,
            savedRecipesCoordinator.navigationController
        ]
    }
}
