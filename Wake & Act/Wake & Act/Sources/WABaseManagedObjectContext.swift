import CoreData

class WABaseManagedObjectContext: NSManagedObjectContext {

	private let resourceName = "Wake__Act"
	private let momdExtension = ".momd"
	private let sqLiteExtension = ".sqlite"

	required override init(concurrencyType concurencyType: NSManagedObjectContextConcurrencyType) {
		super.init(concurrencyType: concurencyType)

		let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
		guard let documentsURL = url else { return }

		let sqlLiteURL = documentsURL.appendingPathComponent(resourceName.appending(sqLiteExtension))
		let model = NSManagedObjectModel(contentsOf: Bundle.main.url(forResource: resourceName, withExtension: momdExtension)!)
		guard let managedObjectModel = model else { return }

		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
		do {
			try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqlLiteURL, options: nil)
		} catch {
			let dictionary: [String: AnyObject] = [
				NSLocalizedDescriptionKey: "Failed to initialize the application's saved data" as AnyObject,
				NSLocalizedFailureReasonErrorKey: "There was an error creating or loading the application's data." as AnyObject,
				NSUnderlyingErrorKey: error as NSError
			]

			let wrappedError = NSError(domain: "com.baidikoff.wakenact", code: 9999, userInfo: dictionary)
			NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
			abort()
		}

		self.persistentStoreCoordinator = coordinator
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	// MARK: - Open functions
	open func saveContext() {
		if self.hasChanges {
			do {
				try save()
			} catch {
				let nserror = error as NSError
				NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
				abort()
			}
		}
	}
}

extension WABaseManagedObjectContext {
	@nonobjc open static var wakeActContext = WABaseManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
}
