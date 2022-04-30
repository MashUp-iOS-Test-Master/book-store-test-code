//
//  ViewController.swift
//  book-store
//
//  Created by Eddy on 2022/04/23.
//

import UIKit

final class BookListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableFooterView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    private func makeTableFooterView() {
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        
        footer.backgroundColor = .clear
        
        let footerLabel = UILabel(frame: footer.bounds)
        footerLabel.text = "가격 합계 : "
        footerLabel.textAlignment = .center
        footer.addSubview(footerLabel)
        
        tableView.tableFooterView = footer
    }
}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

}

