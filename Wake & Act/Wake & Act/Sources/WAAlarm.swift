import CoreData

class WAAlarm: WABaseManagedObject {
	@NSManaged private var identifier: String
	@NSManaged open var name: String
	@NSManaged open var time: Date
	@NSManaged open var twitterAttributes: [String]
	@NSManaged open var enabled: Bool
	@NSManaged open var daysToRepeat: [String]
	
	override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
		super.init(entity: entity, insertInto: context)
		self.identifier = UUID.init().uuidString
	}
}

extension WAAlarm {
	open var formattedTime: String {
		return DateFormatter.localisedTimeFormatter.string(from: time)
	}
}
