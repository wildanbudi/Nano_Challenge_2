//
//  DataModel.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 28/07/22.
//

import Foundation
import NotionClient

struct NotionModel: Identifiable {
    var id: ObjectIdentifier
    
    var modelData = [NotionPage]().self
}
