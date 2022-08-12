//
//  AlbumDetailsViewModel.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit


class AlbumDetailsViewModel: AlbumDetailsViewModelProtocol {
    private let album: Album!
    
    init(album: Album) {
        self.album = album
    }
}

// MARK: - Getters
extension AlbumDetailsViewModel {
    var id: String { "ID: \(album.id)" }
    var title: String { album.title }
    var image: URL { URL(string: album.url) ?? URL(fileURLWithPath: "") }
}
