//
//  KeyValueLabel.swift
//  Rick&Morty
//
//  Created by Леонид Турко on 01.12.2024.
//

import UIKit

final class KeyValueLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


// MARK: - Public
extension KeyValueLabel {
  func update(key: String, value: String) {
    
    let keyAttributed = NSAttributedString(makeKeyString(key))
    let valueAttributed = NSAttributedString(makeValueString(value))
    
    let result = NSMutableAttributedString()
    result.append(keyAttributed)
    result.append(valueAttributed)
    
    attributedText = result
  }
  
  func update(text: String) {
    let underlinedText = NSAttributedString(makeUnderlineString(text))
    
    let result = NSMutableAttributedString()
    result.append(underlinedText)
    attributedText = result
  }
}

// MARK: - Private
private extension KeyValueLabel {
  func makeKeyString(_ string: String) -> AttributedString {
    var attributedString = AttributedString(string)
    attributedString.foregroundColor = .yellow
    attributedString.backgroundColor = .pink
    attributedString.font = .boldSystemFont(ofSize: 15)
    return attributedString
  }
  
  func makeValueString(_ string: String) -> AttributedString {
    var attributedString = AttributedString(string)
    attributedString.foregroundColor = .pink
    attributedString.backgroundColor = .yellow
    attributedString.font = .systemFont(ofSize: 15)
    attributedString.underlineStyle = .single
    return attributedString
  }
  
  func makeUnderlineString(_ string: String) -> AttributedString {
    var attributedString = AttributedString(string)
    attributedString.underlineStyle = NSUnderlineStyle.single
    return attributedString
  }
}
