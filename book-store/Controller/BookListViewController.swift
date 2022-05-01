//
//  ViewController.swift
//  book-store
//
//  Created by Eddy on 2022/04/23.
//

import UIKit

final class BookListViewController: UITableViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeTableFooterView()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    func showIndicatorView() {
        self.view.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
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


extension BookListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BookDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookDetailTableViewCell") as? BookDetailTableViewCell else {
            return BookDetailTableViewCell()
        }
        
        showIndicatorView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityIndicator.stopAnimating()
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // TODO: cell 삭제 필요
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
    
}
