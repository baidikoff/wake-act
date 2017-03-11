//
//  WAManagedObjectContext.swift
//  Wake & Act
//
//  Created by Nick Baidikoff on 3/11/17.
//  Copyright © 2017 Nick Baidikoff. All rights reserved.
//

import Foundation
import CoreData

class WAManagedObjectContext {
	
	// MARK: - Constants
	private let name = "Wake__Act"
	private let momdExtension = ".momd"
	private let sqLiteExtension = ".sqlite"
	
	// MARK: - Stored properties
	private let managedObjectContext: NSManagedObjectContext?
	
	// MARK: - Init
	init() {
		let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
			
		guard let documentsURL = url else {
			self.managedObjectContext = nil
			return
		}
		
		let sqlLiteURL = documentsURL.appendingPathComponent(name.appending(sqLiteExtension))
		let model = NSManagedObjectModel(contentsOf: Bundle.main.url(forResource: name, withExtension: momdExtension)!)
		
		guard let managedObjectModel = model else {
			self.managedObjectContext = nil
			return
		}
		
		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
		
		do {
			try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqlLiteURL, options: nil)
		} catch {
			var dict = [String: AnyObject]()
			dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
			dict[NSLocalizedFailureReasonErrorKey] = "There was an error creating or loading the application's saved data." as AnyObject?
			dict[NSUnderlyingErrorKey] = error as NSError
			
			let wrappedError = NSError(domain: "com.baidikoff.wakenact", code: 9999, userInfo: dict)
			NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
			abort()
		}
		
		let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
		managedObjectContext.persistentStoreCoordinator = coordinator
		
		self.managedObjectContext = managedObjectContext
	}
	
	// MARK: - Open functions
	open func saveContext() {
		if let managedObjectContext = self.managedObjectContext, managedObjectContext.hasChanges {
			do {
				try managedObjectContext.save()
			} catch {
				let nserror = error as NSError
				NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
				abort()
			}
		}
	}
}
