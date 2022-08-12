//
//  MainControllerCell.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit



class AlbumCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var albumThumbnailImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumIDLabel: UILabel!
    
    
    // MARK: Properties
    static let cellID = "albumCellID"

    var viewModel: AlbumCellViewModelProtocol! {
      didSet { refresh() }
    }
    
    // MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    // MARK: Methods
    fileprivate func refresh() {
        guard viewModel != nil else { return }
        albumIDLabel.text = viewModel.id
        albumTitleLabel.text = viewModel.title
        ImageLoader.image(for: viewModel.thumbnailUrl) { image in
          self.albumThumbnailImageView.image = image
        }
    }
    
}
