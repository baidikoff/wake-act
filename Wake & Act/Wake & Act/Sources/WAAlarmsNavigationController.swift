import UIKit
import Foundation

class WAAlarmsNavigationController: WABaseNavigationController {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		pushViewController(WAAlarmsTableViewController(), animated: false)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let name = Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String {
			title = name
		}
	}
}
