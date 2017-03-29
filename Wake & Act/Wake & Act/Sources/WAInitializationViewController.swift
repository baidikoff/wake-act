import UIKit
import SDWebImage

class WAInitializationViewController: WABaseViewController {
	
	@IBOutlet weak var clockGIF: UIImageView!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		view.backgroundColor = .mainRed
		clockGIF.image = UIImage.sd_animatedGIFNamed("clock")
		self.perform(#selector(performSegue(withIdentifier:)), with: Segue.toAlarmsSegue.rawValue, afterDelay: 2.58)
	}
}
