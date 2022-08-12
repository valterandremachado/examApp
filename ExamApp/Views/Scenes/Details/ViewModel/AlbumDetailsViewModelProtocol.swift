//
//  AlbumDetailsViewModelProtocol.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import Foundation

protocol AlbumDetailsViewModelProtocol {
    var id: String { get }
    var title: String { get }
    var image: URL { get }
}
