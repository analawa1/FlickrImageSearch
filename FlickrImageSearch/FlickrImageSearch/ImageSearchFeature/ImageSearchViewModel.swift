//
//  ImageSearchViewModel.swift
//  FlickrImageSearch
//
//  Created by Amit Nalawade on 3/27/24.
//

import Foundation

class ImageSearchViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    var imageSearchError: Error?
    
    init() {}
    
    @MainActor
    func search(for tag: String) async throws {
        do {
            guard !tag.isEmpty else { throw ImageSearchError.invalidInput }
            let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(tag)"
            if let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                if let imageSearchUrl = URL(string: encodedUrlString) {
                    let imageSearchRequest = URLRequest(url: imageSearchUrl)
                    let (data, _) = try await URLSession.shared.data(for: imageSearchRequest)
                    let imageSearchResponse = try JSONDecoder().decode(ImageSearchResponse.self, from: data)
                    self.images = imageSearchResponse.items
                }
            }
        } catch {
            imageSearchError = error
        }
    }
}

enum ImageSearchError: Error {
    case invalidInput
}
