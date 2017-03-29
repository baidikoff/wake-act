import UIKit

class WABaseTableViewController<DataType, WATableViewCell: WABaseTableViewCell<DataType>>: UITableViewController {
	private let cellReuseIdentifier = String(describing: WATableViewCell.self)
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

	open var data = [DataType]() {
		didSet {
			tableView.reloadData()
			if tableView.numberOfRows(inSection: 0) > 0 {
				tableView.scrollToRow(at: IndexPath(index: 0), at: .top, animated: true)
			}
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(WATableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? WATableViewCell {
			cell.configure(withItem: data[indexPath.row])
			return cell
		} else {
			return UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)
		}
	}
}
