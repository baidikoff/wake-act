import UIKit
import ChameleonFramework

class WABaseNavigationController: UINavigationController {
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	override func viewDidLoad() {
		self.hidesNavigationBarHairline = true
		self.navigationBar.isTranslucent = false
		self.navigationBar.tintColor = .mainRed
	}
}
