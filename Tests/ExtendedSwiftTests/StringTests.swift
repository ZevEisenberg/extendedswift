//
//  File.swift
//  
//
//  Created by Dave DeLong on 4/1/23.
//

import Foundation
import XCTest

class StringTests: XCTestCase {
    
    func testHTMLDecoding() {
        XCTAssertEqual("é&eacute;&#233;&#xe9;é".decodingHTMLEntities(), "ééééé")
    }
    
    func testHTMLEncoding() {
        XCTAssertEqual("é".encodingHTMLEntities(options: [.preferNamedEntities]), "&eacute;")
        XCTAssertEqual("é".encodingHTMLEntities(options: [.useHexEntities]), "&#xe9;")
        XCTAssertEqual("é".encodingHTMLEntities(options: [.useHexEntities, .useUppercaseHex]), "&#xE9;")
        XCTAssertEqual("é".encodingHTMLEntities(options: [.useHexEntities, .padNumericEntitiesToFourDigits]), "&#x00e9;")
        XCTAssertEqual("é".encodingHTMLEntities(options: [.useHexEntities, .useUppercaseHex, .padNumericEntitiesToFourDigits]), "&#x00E9;")
        XCTAssertEqual("é".encodingHTMLEntities(), "&#233;")
        XCTAssertEqual("é".encodingHTMLEntities(options: [.padNumericEntitiesToFourDigits]), "&#0233;")
    }
    
}
