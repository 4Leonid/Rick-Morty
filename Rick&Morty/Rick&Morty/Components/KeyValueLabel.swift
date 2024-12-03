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
        
        commonInit()
    }
    
    func commonInit() {

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeKeyString(_ string: String) -> AttributedString {
        //let string = "Planet: "
        var attributedString = AttributedString(string)
        
        attributedString.foregroundColor = .yellow
        attributedString.backgroundColor = .pink
        attributedString.font = .boldSystemFont(ofSize: 15)
        
        return attributedString
    }
    
    func makeValueString(_ string: String) -> AttributedString {
        //let string = "Earth"
        var attributedString = AttributedString(string)
        
        attributedString.foregroundColor = .pink
        attributedString.backgroundColor = .yellow
        attributedString.font = .systemFont(ofSize: 15)
        attributedString.underlineStyle = .single
        
        return attributedString
    }
    
    func update(key: String, value: String) {
        
        let keyAttributed = NSAttributedString(makeKeyString(key))
        let valueAttributed = NSAttributedString(makeValueString(value))
        
        let result = NSMutableAttributedString()
        result.append(keyAttributed)
        result.append(valueAttributed)
    
        attributedText = result
    }
  
  func makeUnderlineString(_ string: String) -> AttributedString {
    var attributedString = AttributedString(string)
    
    attributedString.underlineStyle = NSUnderlineStyle.single
    
    return attributedString
  }
  
  func update(text: String) {
    let underlinedText = NSAttributedString(makeUnderlineString(text))
    
    let result = NSMutableAttributedString()
    result.append(underlinedText)
    
    attributedText = result
  }
}
