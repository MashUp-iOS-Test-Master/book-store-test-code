//
//  ViewController.swift
//  BookStore
//
//  Created by Eddy on 2022/05/30.
//

import UIKit

final class BookViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let dbManager = DataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dbManager.fetchJokes()
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? RegisterViewController else { return }
    }
}

// MARK: - DataSource

extension BookViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return dbManager.books.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BookTableViewCell.identifier,
            for: indexPath) as? BookTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setup(book: dbManager.books[indexPath.row])
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        return true
    }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            let joke = dbManager.books[indexPath.row]
            self.dbManager.delete(joke: joke)
            self.dbManager.books.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
}
