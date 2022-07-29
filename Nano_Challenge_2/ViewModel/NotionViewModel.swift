//
//  APIHelperViewModel.swift
//  Nano_Challenge_2
//
//  Created by Wildan Budi on 28/07/22.
//

import SwiftUI
import NotionClient

class NotionViewModel: ObservableObject {
    @Published var notionData: [NotionPage] = []

    public func getData () {
        print(notionData)
        APIRequest.shared.postRequest(onSuccess: { (values) in
            self.notionData = values!
            print(self.notionData)
        }) { (error) in
            print(error!)
        }
    }
}
