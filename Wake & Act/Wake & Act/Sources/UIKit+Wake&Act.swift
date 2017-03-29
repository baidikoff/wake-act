import UIKit

extension UIColor {
	convenience init(hex: Int) {
		self.init(hex: hex, alpha: 1.0)
	}
	
	convenience init(hex: Int, alpha: CGFloat) {
		self.init(intRed: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff, alpha: alpha)
	}
	
	convenience init(intRed: Int, green: Int, blue: Int, alpha: CGFloat) {
		self.init(red: CGFloat(intRed) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
	}
}

extension UIColor {
	public static var eerieBlack: UIColor {
		return UIColor(hex: 0x161925)
	}
	
	public static var japaneseIndigo: UIColor {
		return UIColor(hex: 0x23395B)
	}
	
	public static var queenBlue: UIColor {
		return UIColor(hex: 0x406E8E)
	}
	
	public static var pewterBlue: UIColor {
		return UIColor(hex: 0x8EA8C3)
	}
	
	public static var aeroBlue: UIColor {
		return UIColor(hex: 0xCBF7ED)
	}
	
	public static var mainRed: UIColor {
		return UIColor(intRed: 227, green: 108, blue: 76, alpha: 1.0)
	}
}
