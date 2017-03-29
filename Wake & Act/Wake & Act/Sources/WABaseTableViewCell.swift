import UIKit

protocol Configurable {
	associatedtype Item
	
	func configure(withItem item: Item)
}

class WABaseTableViewCell<DataType>: UITableViewCell, Configurable {
	func configure(withItem item: DataType) {
		
	}
}
