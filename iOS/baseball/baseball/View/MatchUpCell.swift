//
//  MatchUpCell.swift
//  baseball
//
//  Created by 박정하 on 2021/05/03.
//

import UIKit

class MatchUpCell: UIView {
    
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var gameNumber: UILabel!
    
    private var delegate: GameSelectViewControllerManageable!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCell(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    //storyBoard!!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCell(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    func set(delegate: GameSelectViewControllerManageable) {
        self.delegate = delegate
    }
    
    @objc private func didTapCell(_ gesture: UITapGestureRecognizer) {
        self.delegate.moveToTeamSelectView()
    }
    
    internal func updateCellLabel(homeTeam: String, awayTeam: String, gameNumber: String) {
        DispatchQueue.main.async {
            self.awayLabel.text = awayTeam
            self.homeLabel.text = homeTeam
            self.gameNumber.text = gameNumber
        }
    }
}
