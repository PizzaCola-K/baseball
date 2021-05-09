//
//  InGameViewController.swift
//  baseball
//
//  Created by 박정하 on 2021/05/04.
//

import UIKit
import Lottie

class InGameViewController: UIViewController {
    
    @IBOutlet weak var pitchingHistoryTableView: UITableView!
    @IBOutlet weak var inningInfoView: InningInfoView!
    @IBOutlet weak var fieldView: FieldView!
    
    let animationView: AnimationView = {
        let animationView = AnimationView(name: "data")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.tag = 100
        animationView.contentMode = .scaleAspectFit
        return animationView
    }()
    
    private var dataSource = PitchingHistoryDataSource()
    
    override func viewDidLoad() {
        //        super.viewDidLoad()
        dataSource.setupDataSource(tableView: pitchingHistoryTableView)
        self.inningInfoView.applyBallCount(strike: 2, ball: 2, out: 1)
        self.inningInfoView.applyBallCount(strike: 0, ball: 0, out: 2)
    }
    
    @IBAction func Pitch(_ sender: Any) {
        self.view.addSubview(animationView)
        animationView.play { [weak self] _ in
            self?.removeAnimationView()
        }
    }
    private func removeAnimationView() {
        if let tag = self.view.viewWithTag(100) {
            tag.removeFromSuperview()
        }
    }
}

