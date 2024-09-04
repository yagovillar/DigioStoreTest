import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create the window with the screen bounds
        window = UIWindow(frame: UIScreen.main.bounds)
        // Create a UINavigationController
        let navVC = UINavigationController()
        // Set up the MainCoordinator with the navigation controller
        let coordinator = MainCoordinator(navigationController: navVC)
        coordinator.start()
        // Set the root view controller to the navigation controller
        window?.rootViewController = navVC
        // Make the window visible
        window?.makeKeyAndVisible()
        return true
    }
}
