import UIKit
import Foundation
import CoreData
import AlecrimCoreData

let globalPersistentContainer = PersistentContainer(name: "Wake___Act")

@UIApplicationMain
class WAAppController: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func applicationDidFinishLaunching(_ application: UIApplication) {
		UINavigationBar.appearance().tintColor = .mainRed
	}
}
