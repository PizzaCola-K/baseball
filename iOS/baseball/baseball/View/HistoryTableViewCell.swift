//
//  HistoryTableViewCell.swift
//  baseball
//
//  Created by user on 2021/05/13.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var pitching: UILabel!
    @IBOutlet weak var ballCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(history: PitchingHistory, indexPath: IndexPath) {
        self.pitching.text = history.pitch
        self.ballCount.text = history.state
        self.totalCount.attributedText = intToAttributedString(number: indexPath.row)
    }
    
    func intToAttributedString(number: Int) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "\(number + 1).circle.fill")
        
        let totalCount = NSMutableAttributedString(string: "")
        totalCount.append(NSAttributedString(attachment: imageAttachment))
        return totalCount
    }
}
