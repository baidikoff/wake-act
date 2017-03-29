class WABaseManagedObjectFetcher<ManagedObject: WABaseManagedObject> {
	private var context: WABaseManagedObjectContext

	init() {
		self.context = WABaseManagedObjectContext.wakeActContext
	}
}
