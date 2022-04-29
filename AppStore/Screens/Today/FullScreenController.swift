//
//  FullScreenController.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/26/22.
//

import UIKit

class FullScreenController: UITableViewController {
    
    var dismissHandler: (() -> ())?
    var todayItem: TodayResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let headerCell = FullScreenHeaderCell()
            headerCell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            headerCell.todayCell.todayItem = todayItem
            return headerCell
        }
        let cell = FullScreenCell()
        return cell
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 450
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
    
    @objc func handleDismiss(button: UIButton) {
        button.isHidden = true
        
        dismissHandler?()
    }
}