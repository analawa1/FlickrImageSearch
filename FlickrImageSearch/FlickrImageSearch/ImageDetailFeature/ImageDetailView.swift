//
//  ImageDetailView.swift
//  FlickrImageSearch
//
//  Created by Amit Nalawade on 3/27/24.
//

import SwiftUI

struct ImageDetailView: View {
    let imageModel: ImageModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                ImageContainerView(url: imageModel.url)
                    .accessibilityLabel("Image container in detail view")
                    .padding()
                
                TitleLabel("Title -", imageModel.title)
                TitleLabel("Image Width -", imageModel.imageWidth)
                TitleLabel("Image Height -", imageModel.imageHeight)
                TitleLabel("Author -", imageModel.author)
                TitleLabel("Published date -", imageModel.formattedPublishedDate)
            }
            .navigationTitle("Image Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ImageDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailView(
            imageModel: ImageModel(
                title: "Short Eared Owl",
                link: "",
                media: ["m": "https://live.staticflickr.com//65535//53524670420_b6f8a08185_m.jpg"],
                dateTaken: "",
                description: "formatted description, width=\"240\" height=\"200\"",
                published: "2024-02-11T20:26:59Z",
                author: "nobody@flickr.com (\"antonfalco2\")",
                authorId: "",
                tags: ""
            )
        )
    }
}
