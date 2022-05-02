//
//  BookDetailTableViewCell.swift
//  book-store
//
//  Created by Eddy on 2022/04/24.
//

import UIKit

final class BookDetailTableViewCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var category: UILabel!
    @IBOutlet private weak var publicationDate: UILabel!
    @IBOutlet private weak var price: UILabel!
    
    private func makeNumberFormatter(price: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let formattedPrice = numberFormatter.string(for: price) ?? "0"
        
        return formattedPrice
    }
}
