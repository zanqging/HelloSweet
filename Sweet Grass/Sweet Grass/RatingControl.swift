
import UIKit


var _rating = ""

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0{
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    
    
    
    var stars = 5
    
    
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
        let filledStarImage = UIImage(named: "filled star")
        let emptyStarImage = UIImage(named: "empty star")
        
        
        for _ in 0..<stars {
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    
    
    
    override func layoutSubviews() {
        
        
        // Set the button's width and height to a square the size of the frame's height.
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus some spacing.
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        
        updateButtonSelectionStates()
        
        
    }
    
    
    // MARK: Button Action
    
    
    func ratingButtonTapped(button: UIButton) {
        
        
        rating = ratingButtons.indexOf(button)! + 1
        _rating = String(rating)
        
        updateButtonSelectionStates()
    }
    
    
    
    
    
    func updateButtonSelectionStates() {
        
        
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
        
        
    }
    
    
}
