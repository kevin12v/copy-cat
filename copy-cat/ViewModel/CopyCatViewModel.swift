//
//  CopyCatViewModel.swift
//  copy-cat
//
//  Created by Kevin Vilca on 16/06/24.
//

import Foundation

class CopyCatViewModel: ObservableObject {
    @Published private var model = CopyCatHistory()
    
    var items: [String] {
        model.items
    }
}
