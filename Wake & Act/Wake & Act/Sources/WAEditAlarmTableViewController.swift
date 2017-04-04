import UIKit
import CoreData
import AlecrimCoreData
import ChameleonFramework

class WAEditAlarmTableViewController: WABaseTableViewController {
	open var alarm: WAAlarm?
	
	override func viewDidLoad() {
		
	}
	
	private func setupBarButton() {
		let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onSaveAction))
		saveBarButton.tintColor = .flatWhite
		
		navigationItem.rightBarButtonItem = saveBarButton
	}
	
	func onSaveAction() {
		print("save")
	}
}
