//
//  AlbumViewModelProtocol.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import Foundation

protocol AlbumViewModelProtocol {
    var listCount: Int { get }
    
    func fetchAlbums(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func getAlbum(
        at index: Int
    ) -> AlbumCellViewModelProtocol
    
    func navigateToDetails(
        at index: Int
    ) -> AlbumDetailsViewModelProtocol
    
}
