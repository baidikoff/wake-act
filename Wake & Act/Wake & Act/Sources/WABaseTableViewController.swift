import UIKit
import DZNEmptyDataSet

class WABaseTableViewController: UITableViewController {
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
	}
}
