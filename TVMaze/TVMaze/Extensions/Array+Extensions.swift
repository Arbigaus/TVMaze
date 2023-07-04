//
//  Array+Extensions.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 03/07/23.
//

import Foundation

extension Array where Element: Identifiable {
    func isLast(_ item: Element) -> Bool {
        guard let last = self.last else { return false }
        return last.id == item.id
    }
}
