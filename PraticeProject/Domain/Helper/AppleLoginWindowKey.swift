//
//  AppleLoginWindowKey.swift
//  PraticeProject
//
//  Created by 백동열 on 2022/08/27.
//

import Foundation
import SwiftUI

struct WindowKeys: EnvironmentKey {
  struct Value {
    weak var value: UIWindow?
  }

  static let defaultValue: Value = .init(value: nil)
}

extension EnvironmentValues {
  var window: UIWindow? {
    get {
      return self[WindowKeys.self].value
    }
    set {
      self[WindowKeys.self] = .init(value: newValue)
    }
  }
}
