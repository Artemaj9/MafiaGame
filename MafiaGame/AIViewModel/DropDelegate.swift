//
//  DropDelegate.swift
//  MafiaGame
//
//  Created by Artem on 10.12.2023.
//

import SwiftUI
import MobileCoreServices

class ImgData: ObservableObject, DropDelegate {
    @Published var totalImages = [Img]()
    @Published var selectedCharacters = [Img]()
//    func appendImages() {
//        for i in 1...14 {
//            totalImages.append(Img(id: i, image: String(i)))
//        }
//    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        // adding images to bottom view...
        for provider in info.itemProviders(for: [String(kUTTypeURL)]) {
            // checking if its available
            if provider.canLoadObject(ofClass: URL.self) {
                print("url loaded")
                let _ = provider.loadObject(ofClass: URL.self) { (url, error) in
                    print(url!)
                    
                    // adding to selected array...
                    // checking the array it is already added...
                    
                   /* ******************
                    I don't need unique!
                    let status = self.selectedImages.contains { (check) -> Bool in
                        if check.image == "\(url!)" { return true }
                        else { return false }
                    }
                    // safely appending...
                    if !status {
                      */
                        // adding animation
                        
                        DispatchQueue.main.async {
                            withAnimation(.easeOut) {
                                self.selectedCharacters.append(Img(id: self.selectedCharacters.count, image: "\(url!)"))
                            }
                        }
                    }
                }
        }
        
        return true
    }
}