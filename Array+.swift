//
//  Array+.swift
//  Memify
//
//  Created by Alibek Sansyzbayev on 5/28/20.
//  Copyright © 2020 Alibek Sansyzbayev. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? { self.count == 1 ? first : nil }
}

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in self.indices {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
