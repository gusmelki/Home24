//
//  SelectionModels.swift
//  Home24
//
//  Created by Gustavo Melki Leal on 24/06/2018.
//  Copyright (c) 2018 Gustavo Melki. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Selection {
  // MARK: Use cases
  
  enum ArticleApi {
    struct Request {
    }
    struct Response {
      var articles : [Article]?
    }
    struct ViewModel {
      var articles : [Article]?
    }
  }
  
  enum ErrorApi {
    struct Response {
      var errorMsg : String
    }
    struct ViewModel {
      var errorMsg : String
    }
  }
  
}
