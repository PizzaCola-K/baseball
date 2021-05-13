//
//  PitchingHistoryTableViewDelegate.swift
//  baseball
//
//  Created by 박정하 on 2021/05/10.
//

import UIKit

class ScoreTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerViewLabels: [UILabel] = [] //UIView와 UILabel 중 어떤 게 더 용량이 클까?
        let headerView: UIView = UIView()
        headerView.backgroundColor = .lightGray
        for i in 0..<5 {
            let tempLabel = makeLabel(title: HeaderViewLabelTitles.allCases[i].value)
            headerView.addSubview(tempLabel)
            headerViewLabels.append(tempLabel)
            headerViewLabels[i].translatesAutoresizingMaskIntoConstraints = false
            headerViewLabels[i].centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
            if i == 0 {
                headerViewLabels[i].leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 10).isActive = true
            }
            else if i == 1 {
                headerViewLabels[i].leadingAnchor.constraint(equalTo: headerViewLabels[i-1].trailingAnchor, constant: 70).isActive = true
            }
            else {
                headerViewLabels[i].leadingAnchor.constraint(equalTo: headerViewLabels[i-1].trailingAnchor, constant: 35).isActive = true
            }
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    private func makeLabel(title: String) -> UILabel {
        let tempLabel: UILabel = UILabel()
        tempLabel.text = title
        tempLabel.font = .systemFont(ofSize: 15)
        tempLabel.sizeToFit()
        return tempLabel
    }
    
    enum headerViewframe: CGFloat {
        case height = 55
    }
    
    enum HeaderViewLabelTitles: String, CaseIterable {
        case batting = "Batting"
        case batterbox = "타석"
        case hit = "안타"
        case out = "아웃"
        case average = "평균"
        
        var value: String {
            return self.rawValue
        }
    }
}
