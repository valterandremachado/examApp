//
//  File.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import Foundation

struct Album: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
