//
//  AlbumViewModel.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit


class AlbumViewModel: AlbumViewModelProtocol {
    
    // MARK: Properties
    private var albums: [Album] = []
    var service: AlbumService!
    
    // MARK: Init
    init(service: AlbumService) {
        self.service = service
    }
    
    
}

// MARK: - Methods

extension AlbumViewModel {
    func fetchAlbums(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        service.fetchAlbums(
            onSuccess: { albums in
                self.albums = albums
                onSuccess()
            },
            onError: onError
        )
    }
    
    func getAlbum(
        at index: Int
    ) -> AlbumCellViewModelProtocol {
        let album = albums[index]
        return AlbumCellViewModel(album: album)
    }
    
    func navigateToDetails(
        at index: Int
    ) -> AlbumDetailsViewModelProtocol {
        let album = albums[index]
        return AlbumDetailsViewModel(album: album)
    }
}


// MARK: - Getters

extension AlbumViewModel {
  var listCount: Int { albums.count }
}
