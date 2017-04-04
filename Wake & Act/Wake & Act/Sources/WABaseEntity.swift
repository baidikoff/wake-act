import CoreData
import Foundation
import AlecrimCoreData

@objc(WABaseEntity)
class WABaseEntity: NSManagedObject {
	@NSManaged var identifier: String

	static let identifier = AlecrimCoreData.Attribute<String>("identifier")
}

extension AlecrimCoreData.AttributeProtocol where Self.ValueType: WABaseEntity {
	var identifier: AlecrimCoreData.Attribute<String> {
		return AlecrimCoreData.Attribute<String>("identifier", self)
	}
}

extension NSManagedObjectContext {
	var entities: AlecrimCoreData.Table<WABaseEntity> {
		return AlecrimCoreData.Table<WABaseEntity>(context: self)
	}
}
