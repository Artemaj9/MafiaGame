//
//  ImageViewModel.swift
//

import Foundation
import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    private let imageDownloadAPI = ImageDownloadAPI()
    @Published var image: UIImage? = nil
    private var cancellables = Set<AnyCancellable>()

    func downloadImage(from url: URL) {
        imageDownloadAPI.downloadImage(from: url)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
            .store(in: &cancellables)
    }
}
