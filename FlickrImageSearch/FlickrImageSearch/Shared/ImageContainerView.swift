//
//  ImageContainerView.swift
//  FlickrImageSearch
//
//  Created by Amit Nalawade on 3/27/24.
//

import SwiftUI

struct ImageContainerView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
            case .failure(let error):
                // Should show a simpler error message to the user
                Text(error.localizedDescription)
            @unknown default:
                // Should show a placeholder here
                EmptyView()
            }
        }
    }
}

struct ImageContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContainerView(url: URL(string: "https://live.staticflickr.com//65535//53524670420_b6f8a08185_m.jpg")!)
            .frame(width: 200, height: 200)
    }
}
