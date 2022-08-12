//
//  DetailsController.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit


class AlbumDetailsController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    // MARK: Properties
    var viewModel: AlbumDetailsViewModelProtocol!
    
}

// MARK: Lifecycle
extension AlbumDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
}

// MARK: Methods
extension AlbumDetailsController {
    fileprivate func setup() {
        populateView()
    }
    
    fileprivate func populateView() {
        guard viewModel != nil else { return }
        navigationItem.title = viewModel.id
        albumTitleLabel.text = viewModel.title
        ImageLoader.image(for: viewModel.image) { [weak self] image in
            guard let self = self else { return }
            self.albumImageView.image = image
        }
    }
    
    
}


