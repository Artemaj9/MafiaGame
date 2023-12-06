//
//  ImageAPI.swift
//

import Foundation
import SwiftUI
import Combine

class ImageDownloadAPI {
    func downloadImage(from url: URL) -> AnyPublisher<UIImage?, Never> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response in UIImage(data: data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
