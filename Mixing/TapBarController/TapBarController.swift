
import UIKit


class TabBarViewController : UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let view1 = createNavController(for: CocktailsListRouter.createModule(), title: "COCKTAILS LIST" , image: UIImage(systemName: "wineglass") ?? UIImage())
        self.viewControllers = [view1]
    }
    
    
    func createNavController(for mainViewController : UIViewController, title : String, image : UIImage ) -> UIViewController {
        let navController = UINavigationController(rootViewController: mainViewController)
        navController.tabBarItem.title = "\(title)"
        mainViewController.navigationItem.title = "\(title)"
        navController.tabBarItem.image = image
        mainViewController.navigationItem.backButtonTitle = "Atras"
        return navController
    }
    
}
