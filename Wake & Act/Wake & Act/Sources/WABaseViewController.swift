import UIKit

class WABaseViewController: UIViewController {
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	open func performSegue(withIdentifier identifier: String) {
		performSegue(withIdentifier: identifier, sender: self)
	}
}
