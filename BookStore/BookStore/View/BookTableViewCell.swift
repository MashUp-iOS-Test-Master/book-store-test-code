//
//  BookTableViewCell.swift
//  BookStore
//
//  Created by Eddy on 2022/05/30.
//

import UIKit

final class BookTableViewCell: UITableViewCell {
  static var identifier: String {
    return String(describing: self)
  }
  
  @IBOutlet weak var bookTitleLabel: UILabel!
  
  func setup(book: BookEntity) {
      bookTitleLabel.text = book.body
  }
}
