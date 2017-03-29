import Foundation

extension DateFormatter {
	public static let localisedTimeFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "hh:mm a"
		return formatter
	}()
}
