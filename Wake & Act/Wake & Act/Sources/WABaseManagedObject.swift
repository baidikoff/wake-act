import CoreData

class WABaseManagedObject: NSManagedObject {
	static let entityName = String(describing: self)
	internal let entityName = String(describing: type(of: self))
}
