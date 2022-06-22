//
//  RegisterViewController.swift
//  BookStore
//
//  Created by Eddy on 2022/05/30.
//

import UIKit

final class RegisterViewController: UIViewController {
  @IBOutlet weak var sentenceTextField: UITextField!
  @IBOutlet weak var segmentControl: UISegmentedControl!
  
  let dbManager = DataManager.shared
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func registerButtonDidTap(_ sender: UIButton) {
    guard let content = sentenceTextField.text else { return }
    var category: BookDTO.Category
    if segmentControl.selectedSegmentIndex == .zero {
        category = .소설
    } else {
        category = .기술
    }
    
    let bookDTO = BookDTO(id: UUID(), body: content, category: category)
    dbManager.register(bookDTO)
    
    self.dismiss(animated: true)
  }
}
