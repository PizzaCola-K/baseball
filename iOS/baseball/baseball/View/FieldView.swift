
import UIKit

class FieldView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        print(self.frame, self.bounds)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.drawMainField()
        self.drawMainFieldStripe()
        self.drawBackground()
        self.drawBase()
    }
    
    func drawMainField() {
        let path = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        
        path.move(to: CGPoint(x: width / 2, y: height))
        path.addLine(to: CGPoint(x: 0, y: height / 3 * 2))
        path.addLine(to: CGPoint(x: 0, y: height / 3))
        path.addQuadCurve(to: CGPoint(x: width, y: height / 3), controlPoint: CGPoint(x: width / 2, y: 0))
        path.addLine(to: CGPoint(x: width, y: height / 3 * 2))
        path.close()
        
        path.lineWidth = 0
        UIColor(red: 141/255, green: 182/255, blue: 88/255, alpha: 1).set()
        
        path.fill()
    }
    
    func drawMainFieldStripe() {
        for index in 0...10 {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: self.bounds.width / 10 * CGFloat(index), y: 0))
            path.addLine(to: CGPoint(x: self.bounds.width / 10 * CGFloat(index), y: self.frame.height))
            UIColor(red: 117/255, green: 172/255, blue: 87/255, alpha: 1).set()
            path.lineWidth = 20
            path.stroke()
        }
    }
    
    func drawBackground() {
        let upperBackgroundPath = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        
        upperBackgroundPath.move(to: CGPoint(x: 0, y: height / 3))
        upperBackgroundPath.addQuadCurve(to: CGPoint(x: width, y: height / 3), controlPoint: CGPoint(x: width / 2, y: 0))
        upperBackgroundPath.addLine(to: CGPoint(x: width, y: 0))
        upperBackgroundPath.addLine(to: CGPoint(x: 0, y: 0))
        UIColor.systemGray4.set()
        upperBackgroundPath.fill()
        
        let insetY: CGFloat = 10
        let insetX: CGFloat = 35
        let lowerBackgroundPath1 = UIBezierPath()
        lowerBackgroundPath1.move(to: CGPoint(x: width / 2, y: height))
        lowerBackgroundPath1.addLine(to: CGPoint(x: width / 2 - insetX, y: height))
        lowerBackgroundPath1.addLine(to: CGPoint(x: 0, y: height / 3 * 2 + insetY))
        lowerBackgroundPath1.addLine(to: CGPoint(x: 0, y: height / 3 * 2))
        UIColor(red: 112/255, green: 156/255, blue: 80/255, alpha: 1).set()
        lowerBackgroundPath1.close()
        lowerBackgroundPath1.fill()
        
        let lowerBackgroundPath2 = UIBezierPath()
        lowerBackgroundPath2.move(to: CGPoint(x: width / 2, y: height))
        lowerBackgroundPath2.addLine(to: CGPoint(x: width / 2 + insetX, y: height))
        lowerBackgroundPath2.addLine(to: CGPoint(x: width, y: height / 3 * 2 + insetY))
        lowerBackgroundPath2.addLine(to: CGPoint(x: width, y: height / 3 * 2))
        UIColor(red: 112/255, green: 156/255, blue: 80/255, alpha: 1).set()
        lowerBackgroundPath2.close()
        lowerBackgroundPath2.fill()
        
        let lowerBackgroundPath3 = UIBezierPath()
        lowerBackgroundPath3.move(to: CGPoint(x: width / 2 - insetX, y: height))
        lowerBackgroundPath3.addLine(to: CGPoint(x: 0, y: height))
        lowerBackgroundPath3.addLine(to: CGPoint(x: 0, y: height / 3 * 2 + insetY))
        UIColor(red: 135/255, green: 118/255, blue: 102/255, alpha: 1).set()
        lowerBackgroundPath3.close()
        lowerBackgroundPath3.fill()
        
        let lowerBackgroundPath4 = UIBezierPath()
        lowerBackgroundPath4.move(to: CGPoint(x: width / 2 + insetX, y: height))
        lowerBackgroundPath4.addLine(to: CGPoint(x: width, y: height))
        lowerBackgroundPath4.addLine(to: CGPoint(x: width, y: height / 3 * 2 + insetY))
        UIColor(red: 135/255, green: 118/255, blue: 102/255, alpha: 1).set()
        lowerBackgroundPath4.close()
        lowerBackgroundPath4.fill()
    }
    
    func drawBase() {
        let homeBasePath = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        
        homeBasePath.move(to: CGPoint(x: width / 2 - 10, y: height - 20))
        homeBasePath.addLine(to: CGPoint(x: width / 2 - 10, y: height - 40))
        homeBasePath.addLine(to: CGPoint(x: width / 2, y: height - 50))
        homeBasePath.addLine(to: CGPoint(x: width / 2 + 10, y: height - 40))
        homeBasePath.addLine(to: CGPoint(x: width / 2 + 10, y: height - 20))
        UIColor.white.set()
        homeBasePath.close()
        homeBasePath.fill()
        
        let firstBasePath = UIBezierPath()
        firstBasePath.move(to: CGPoint(x: width - 10, y: height / 2))
        firstBasePath.addLine(to: CGPoint(x: width - 25, y: height / 2 - 10))
        firstBasePath.addLine(to: CGPoint(x: width - 40, y: height / 2))
        firstBasePath.addLine(to: CGPoint(x: width - 25, y: height / 2 + 10))
        firstBasePath.close()
        firstBasePath.fill()
        
        let secondBasePath = UIBezierPath()
        let secondBaseLocationY: CGFloat = 40
        secondBasePath.move(to: CGPoint(x: width / 2, y: secondBaseLocationY))
        secondBasePath.addLine(to: CGPoint(x: width / 2 - 15, y: secondBaseLocationY + 10))
        secondBasePath.addLine(to: CGPoint(x: width / 2, y: secondBaseLocationY + 20))
        secondBasePath.addLine(to: CGPoint(x: width / 2 + 15, y: secondBaseLocationY + 10))
        secondBasePath.close()
        secondBasePath.fill()
        
        let thirdBasePath = UIBezierPath()
        thirdBasePath.move(to: CGPoint(x: 10, y: height / 2))
        thirdBasePath.addLine(to: CGPoint(x: 25, y: height / 2 - 10))
        thirdBasePath.addLine(to: CGPoint(x: 40, y: height / 2))
        thirdBasePath.addLine(to: CGPoint(x: 25, y: height / 2 + 10))
        thirdBasePath.close()
        thirdBasePath.fill()
        
        UIColor.darkGray.set()
        homeBasePath.stroke()
        firstBasePath.stroke()
        secondBasePath.stroke()
        thirdBasePath.stroke()
        
        let homeToFirstPath = UIBezierPath()
        homeToFirstPath.move(to: CGPoint(x: width / 2 + 5, y: height - 45))
        homeToFirstPath.addLine(to: CGPoint(x: width - 32.5, y: height / 2 + 5))
        homeToFirstPath.lineWidth = 3
        homeToFirstPath.stroke()
        
        let firstToSecondPath = UIBezierPath()
        firstToSecondPath.move(to: CGPoint(x: width - 32.5, y: height / 2 - 5))
        firstToSecondPath.addLine(to: CGPoint(x: width / 2 + 15, y: secondBaseLocationY + 10))
        firstToSecondPath.lineWidth = 3
        firstToSecondPath.stroke()
        
        let secondToThirdPath = UIBezierPath()
        secondToThirdPath.move(to: CGPoint(x: width / 2 - 15, y: secondBaseLocationY + 10))
        secondToThirdPath.addLine(to: CGPoint(x: 32.5, y: height / 2 - 5))
        secondToThirdPath.lineWidth = 3
        secondToThirdPath.stroke()
        
        let thirdToHomePath = UIBezierPath()
        thirdToHomePath.move(to: CGPoint(x: 32.5, y: height / 2 + 5))
        thirdToHomePath.addLine(to: CGPoint(x: width / 2 - 5, y: height - 45))
        thirdToHomePath.lineWidth = 3
        thirdToHomePath.stroke()
    }
}
