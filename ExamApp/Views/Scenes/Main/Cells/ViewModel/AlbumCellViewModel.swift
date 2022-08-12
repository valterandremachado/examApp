//
//  MainCellViewModel.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit


class AlbumCellViewModel: AlbumCellViewModelProtocol {
    
    private let album: Album

    init(album: Album) {
        self.album = album
    }
}

// MARK: Getters
extension AlbumCellViewModel {
    var id: String { "ID: \(album.id)" }
    var title: String { album.title }
    var thumbnailUrl: URL { URL(string: album.thumbnailUrl) ?? URL(fileURLWithPath: "") }
}
