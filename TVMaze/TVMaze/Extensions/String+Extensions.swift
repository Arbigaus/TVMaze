//
//  String+Extensions.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 06/07/23.
//

import Foundation

extension String {
    func removingHTMLTags() -> String {
        let htmlTagRegex = try! NSRegularExpression(pattern: "<.*?>", options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.utf16.count)
        return htmlTagRegex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "")
    }
}
