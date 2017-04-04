import CoreData
import AlecrimCoreData

@objc(WAAlarm)
final class WAAlarm: WABaseEntity {
	@NSManaged open var name: String
	@NSManaged open var time: Date
	@NSManaged open var twitterAttributes: Set<String>
	@NSManaged open var enabled: Bool
	@NSManaged open var daysToRepeat: Set<String>
	
	static let name = AlecrimCoreData.Attribute<String>("name")
	static let time = AlecrimCoreData.Attribute<Date>("time")
	static let twitterAttributes = AlecrimCoreData.Attribute<Set<String>>("twitterAttributes")
	static let enabled = AlecrimCoreData.Attribute<Bool>("enabled")
	static let daysToRepeat = AlecrimCoreData.Attribute<Set<String>>("daysToRepeat")
}

extension AlecrimCoreData.AttributeProtocol where Self.ValueType: WAAlarm {
	var name: AlecrimCoreData.Attribute<String> {
		return AlecrimCoreData.Attribute<String>("name", self)
	}
	
	var time: AlecrimCoreData.Attribute<Date> {
		return AlecrimCoreData.Attribute<Date>("time", self)
	}
	
	var twitterAttributes: AlecrimCoreData.Attribute<Set<String>> {
		return AlecrimCoreData.Attribute<Set<String>>("twitterAttributes", self)
	}
	
	var enabled: AlecrimCoreData.Attribute<Bool> {
		return AlecrimCoreData.Attribute<Bool>("enabled", self)
	}
	
	var daysToRepeat: AlecrimCoreData.Attribute<[String]> {
		return AlecrimCoreData.Attribute<[String]>("daysToRepeat", self)
	}
}

extension NSManagedObjectContext {
	var alarms: AlecrimCoreData.Table<WAAlarm> {
		return AlecrimCoreData.Table<WAAlarm>(context: self)
	}
}
