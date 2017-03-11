//
//  WABaseNavigationController.swift
//  Wake & Act
//
//  Created by Nick Baidikoff on 3/11/17.
//  Copyright © 2017 Nick Baidikoff. All rights reserved.
//

import UIKit
import ChameleonFramework

class WABaseNavigationController: UINavigationController {
	override var hidesNavigationBarHairline: Bool {
		get {
			return true
		}
		set {
			self.hidesNavigationBarHairline = true
		}
	}
}
