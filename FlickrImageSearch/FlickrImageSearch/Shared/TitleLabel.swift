//
//  TitleLabel.swift
//  FlickrImageSearch
//
//  Created by Amit Nalawade on 3/28/24.
//

import SwiftUI

struct TitleLabel: View {
    private let title: String
    private let subTitle: String
    
    init(
        _ title: String,
        _ subTitle: String
    ) {
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        Text(self.title)
            .accessibilityLabel(self.title)
            .font(.callout)
            .bold()
            .padding()
        Text(self.subTitle)
            .accessibilityLabel(self.subTitle)
            .font(.callout)
            .padding(.leading)
    }
}
