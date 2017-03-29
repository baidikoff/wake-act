import UIKit
import Foundation

@UIApplicationMain
class WAAppController: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func applicationDidFinishLaunching(_ application: UIApplication) {
		UINavigationBar.appearance().tintColor = .mainRed
		
	}
}
