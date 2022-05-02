//
//  BookDetailViewController.swift
//  book-store
//
//  Created by Eddy on 2022/04/25.
//

import UIKit

final class BookDetailViewController:
    UIViewController {
    var allBookInfo: [BookInfo]?
    @IBOutlet private weak var bookTitle: UITextField!
    @IBOutlet private weak var publicationDate: UITextField!
    @IBOutlet private weak var price: UITextField!
    @IBOutlet private weak var category: UIButton!
    
    @IBAction func done(_ sender: UIButton) {
        addBookInfo()
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func category(_ sender: Any) {
        let alertMessage = UIAlertController(title: "원하는 카테고리 선택하세요", message: nil, preferredStyle: .actionSheet)
        alertMessage.addAction(UIAlertAction(title: "소설", style: .default, handler: setCategoryValue))
        alertMessage.addAction(UIAlertAction(title: "기술", style: .default, handler: setCategoryValue))
        alertMessage.addAction(UIAlertAction(title: "경제", style: .default, handler: setCategoryValue))
        alertMessage.addAction(UIAlertAction(title: "시집", style: .default, handler: setCategoryValue))
        alertMessage.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(alertMessage, animated: true)
    }
    
    private func setCategoryValue(action: UIAlertAction) {
        category.titleLabel?.text = action.title
    }
}

extension BookDetailViewController {
    
    private func saveBookData(info: BookInfo) {
        while allBookInfo != nil {
            allBookInfo?.append(info)
        }
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(allBookInfo), forKey: "userInfo")
    }
    
    private func addBookInfo() {
        let title = bookTitle.text ?? "0"
        let publicationDate = publicationDate.text ?? "0"
        let price = price.text ?? "0"
        let category = category.titleLabel?.text ?? "0"
        
        let user = BookInfo(title: title, publicationDate: publicationDate, price: price, category: category)
        
        saveBookData(info: user)
    }
}
