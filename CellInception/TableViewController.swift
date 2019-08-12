//
//  TableViewController.swift
//  CellInception
//
//  Created by Daniel Munoz on 10.08.19.
//  Copyright © 2019 Daniel Munoz. All rights reserved.
//

import UIKit

final class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "tableCell")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! MyTableViewCell
        cell.update()
//        cell.layoutIfNeeded()
        return cell
    }

}
