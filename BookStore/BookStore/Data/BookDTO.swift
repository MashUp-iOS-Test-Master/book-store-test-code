//
//  JokeDTO.swift
//  BookStore
//
//  Created by Eddy on 2022/05/30.
//

import Foundation

struct BookDTO {
  let id: UUID
  let body: String
  let category: Category
  
  enum Category: String {
    case 소설
    case 기술
  }
}
