import UIKit
import DZNEmptyDataSet
import CoreData
import AlecrimCoreData

class WAAlarmsTableViewController: WABaseTableViewController {
	fileprivate let cellReuseIdentifier = String(describing: WAAlarmTableViewCell.self)
	
	fileprivate private(set) lazy var alarmsController: FetchRequestController<WAAlarm> = {
		let alarms = globalPersistentContainer.viewContext.alarms.orderBy { $0.time }
		return alarms.toFetchRequestController()
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupTableView()
		setupAlarms()
		setupBarButton()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		checkControls()
	}
	
	private func setupTableView() {
		tableView.emptyDataSetSource = self
		tableView.allowsSelectionDuringEditing = true
		
		clearsSelectionOnViewWillAppear = true
	}
	
	private func setupBarButton() {
		editButtonItem.tintColor = .flatWhite
		navigationItem.leftBarButtonItem = editButtonItem
	}
	
	private func setupAlarms() {
		self.alarmsController.bind(to: self.tableView)
		
		let closure = { [weak self] (object: WAAlarm, indexPath: IndexPath) -> Void in
			self?.checkControls()
		}
		self.alarmsController.didInsertObject(closure: closure).didDeleteObject(closure: closure)
	}
	
	private func checkControls() {
		if self.alarmsController.numberOfObjects(inSection: 0) > 0 {
			self.editButtonItem.isEnabled = true
		} else {
			self.isEditing = false
			self.editButtonItem.isEnabled = false
		}
	}
	
	@IBAction func onAddAction(_ sender: Any) {
		performSegue(withIdentifier: Segue.addAlarmSegue.rawValue, sender: self)
	}
	
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		self.isEditing = false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let identifier = segue.identifier else { return }
		guard let destination = segue.destination as? WAEditAlarmTableViewController else { return }

		if identifier == Segue.addAlarmSegue.rawValue {
			destination.alarm = nil
		} else if identifier == Segue.editAlarmSegue.rawValue {
			guard let indexPath = tableView.indexPathForSelectedRow else { return }
			destination.alarm = alarmsController.object(at: indexPath)
		}
	}
}

// MARK: - UITableViewDelegate
extension WAAlarmsTableViewController {
	override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		return self.isEditing ? indexPath : nil
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard self.isEditing else { return }
		
		performSegue(withIdentifier: Segue.editAlarmSegue.rawValue, sender: self)
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		guard editingStyle == .delete else { return }
		
		let alarm = self.alarmsController.object(at: indexPath)
		
		globalPersistentContainer.performBackgroundTask { backgroundContext in
			do {
				let alarm = try alarm.inContext(backgroundContext)
				alarm.delete()
				try backgroundContext.save()
			} catch {
				print("error")
			}
		}
	}
}

// MARK: - UIITableViewDataSource
extension WAAlarmsTableViewController {	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return alarmsController.numberOfObjects(inSection: 0)
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? WAAlarmTableViewCell {
			let alarm = alarmsController.object(at: indexPath)
			cell.configure(withItem: alarm)
			return cell
		} else {
			return WAAlarmTableViewCell()
		}
	}
}

// MARK: - DZNEmptyDataSetSource
extension WAAlarmsTableViewController: DZNEmptyDataSetSource {
	func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
		return NSAttributedString(string: "No alarms set yet", attributes: nil)
	}
	
	func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
		return NSAttributedString(string: "It's time to set the first one", attributes: nil)
	}
}
