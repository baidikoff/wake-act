import UIKit
import Foundation

class WAAlarmsNavigationController: WABaseNavigationController {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.flatWhite]
	}
}
