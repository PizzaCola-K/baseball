//
//  ViewController.swift
//  baseball
//
//  Created by 박정하 on 2021/05/03.
//

import UIKit
import OctoKit
import AuthenticationServices

class GameSelectViewController: UIViewController, GameSelectViewControllerManageable {
  
    @IBOutlet weak var matchupCell: MatchUpCell!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.matchupCell.set(delegate: self)
        playOpacityAnimation()
        playMoveAnimation()
    }
    
    // 질문하기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let tabBarViewController = segue.destination as? UITabBarController,
              let tabbarFirstViewController = tabBarViewController.viewControllers?[0] as? InGameViewController else {
            return
        }
        guard let selectedTeamInfo = sender as? MyTeam else {
            return
        }
        tabbarFirstViewController.decide(team: selectedTeamInfo)
    }
    
    func moveToTeamSelectView() {
        let teamSelectView = Bundle.main.loadNibNamed("TeamSelectView", owner: self, options: nil)?.first as! TeamSelectView
        teamSelectView.frame = self.view.frame
        self.view.addSubview(teamSelectView)
        dismissTeamSelectView(view: teamSelectView)
        decideTeam(view: teamSelectView)
    }
    
    func decideTeam(view: TeamSelectView) {
        view.pressedTeam { (myTeam) -> (Void) in
            self.performSegue(withIdentifier: "toInGame", sender: myTeam)
        }
    }
    
    func dismissTeamSelectView(view: TeamSelectView) {
        view.pressedCancel { (bool) -> (Void) in
            if bool {
                DispatchQueue.main.async {
                    UIView.transition(with: view.cardView, duration: 0.8, options: .transitionCurlUp, animations: nil) { (_) in
                        view.removeFromSuperview()
                    }
                    view.cardView.alpha = 0
                }
            }
        }
    }
    
    private func playOpacityAnimation() -> Void {
            let layerWidth = view.bounds.size.width / 4
            let myCalayer : CALayer = {
                let calayer = CALayer()
                calayer.bounds = CGRect(x: 0, y: 0, width: layerWidth, height: layerWidth)
                calayer.position = CGPoint(x: view.bounds.size.width / 2 , y: layerWidth)
                calayer.backgroundColor = UIColor.black.cgColor
                return calayer
            }()
            view.layer.addSublayer(myCalayer)
            let animation: CABasicAnimation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 1
            animation.toValue = 0
            animation.duration = 1
            animation.repeatCount = 10 //
            myCalayer.add(animation, forKey: "GoRed")
            myCalayer.opacity = 0
        }
        
    private func playMoveAnimation() -> Void {
        
        let layerWidth = view.bounds.size.width / 4
        let myCalayer : CALayer = {
            let calayer = CALayer()
            calayer.bounds = CGRect(x: 0, y: 0, width: layerWidth, height: layerWidth)
            calayer.position = CGPoint(x: view.bounds.size.width / 2 , y: layerWidth)
            calayer.backgroundColor = UIColor.black.cgColor
            return calayer
        }()
        view.layer.addSublayer(myCalayer)
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        animation.fromValue = myCalayer.position
        animation.toValue = CGPoint(x: myCalayer.position.x, y: view.bounds.size.height - view.bounds.size.width / 4)
        animation.duration = 1
        myCalayer.add(animation, forKey: "move down")
//        myCalayer.position = CGPoint(x: myCalayer.position.x, y: view.bounds.size.height - view.bounds.size.width / 4)
    }
}
