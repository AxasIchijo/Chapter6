//
//  ArrayExtentions.swift
//  Chapter6
//
//  Created by AXLT0221-AP on 2022/04/04.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }
        
        set (value) {
            if value == nil {
                return
            }

            if !(indices.contains(index)) {
                NSLog("WARN: index:\(index) is out of range, so ignored. (array:\(self))")
                return
            }

            self[index] = value!
        }
    }
}
