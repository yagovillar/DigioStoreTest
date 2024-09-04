//
//  Coordinator.swift
//  DigioStore
//
//  Created by Yago Vanzan on 04/09/24.
//

import Foundation
import UIKit

protocol Coordinator {

  var navigationController: UINavigationController { get set }
  
  func start()

}
