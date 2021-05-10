
import UIKit

class InningInfoView: UIView {
    @IBOutlet var ballCountViews: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.drawEmptyBallCount()
    }
    
    func drawEmptyBallCount() {
        let repeatCount = [2, 3, 2]
        let inset: CGFloat = 3
        let ballWidth: CGFloat = 23
        let locationX = ballWidth / 2
        
        for viewIndex in 0..<ballCountViews.count {
            let locationY =  ballCountViews[viewIndex].frame.height / 2
            for index in 0..<repeatCount[viewIndex] {
                let emptyCircle = drawCircle()
                emptyCircle.position = CGPoint(x: locationX + ballWidth * CGFloat(index) + inset * CGFloat(index), y: locationY)
                ballCountViews[viewIndex].layer.addSublayer(emptyCircle)
            }
        }
    }
    
    func drawCircle() -> CALayer {
        let ballWidth = 23
        let circle = CALayer()
        circle.bounds = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: ballWidth, height: ballWidth))
        circle.backgroundColor = UIColor.systemGray4.cgColor
        circle.cornerRadius = 11
        circle.borderWidth = 1
        circle.borderColor = UIColor.gray.cgColor
        return circle
    }
    
    func applyBallCount(strike: Int, ball: Int, out: Int) {
        let maxStrikeCount = 2
        let maxBallCount = 3
        let maxOutCount = 2
        
        for index in 0..<maxStrikeCount {
            if let emptyBall = self.ballCountViews[0].layer.sublayers?[index] {
                if index < strike {
                    emptyBall.backgroundColor = UIColor.systemYellow.cgColor
                } else {
                    emptyBall.backgroundColor = UIColor.systemGray4.cgColor
                }
            }
        }

        for index in 0..<maxBallCount {
            if let emptyBall = self.ballCountViews[1].layer.sublayers?[index] {
                if index < ball {
                    emptyBall.backgroundColor = UIColor.systemYellow.cgColor
                } else {
                    emptyBall.backgroundColor = UIColor.systemGray4.cgColor
                }
            }
        }
        
        for index in 0..<maxOutCount {
            if let emptyBall = self.ballCountViews[2].layer.sublayers?[index] {
                if index < out {
                    emptyBall.backgroundColor = UIColor.systemYellow.cgColor
                } else {
                    emptyBall.backgroundColor = UIColor.systemGray4.cgColor
                }
            }
        }
    }
    
}
