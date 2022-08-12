//
//  ViewController.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit


class AlbumController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    var activityIndicatorView: ActivityIndicatorView!

    var service = AlbumService()
    var viewModel: AlbumViewModel!
    

}

// MARK: Lifecycle
extension AlbumController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

}

// MARK: Methods
extension AlbumController {
    fileprivate func setup() {
        setupTableView()
        configViewModel()
        setupProgressIndicator()
    }
    
    fileprivate func setupTableView() {
        tableView.register(
            UINib(nibName: "AlbumCell", bundle: nil),
            forCellReuseIdentifier: AlbumCell.cellID
        )
    }
    
    fileprivate func setupProgressIndicator() {
        activityIndicatorView = ActivityIndicatorView(
            title: "Please Wait...",
            center: view.center
        )
        
        view.addSubview(self.activityIndicatorView.getViewActivityIndicator())
        activityIndicatorView.startAnimating()
    }
    
    fileprivate func configViewModel() {
        viewModel = AlbumViewModel(service: service)
        viewModel.fetchAlbums(
            onSuccess: handleSuccess(),
            onError: handleError()
        )
    }
}

// MARK: TableView Delegate & DataSource
extension AlbumController: TableViewDelegateDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AlbumCell.cellID,
            for: indexPath
        ) as? AlbumCell
        else { return UITableViewCell() }
        cell.viewModel = viewModel.getAlbum(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigateToDetailsScreen(at: indexPath.row)
    }

}

// MARK: Handlers
extension AlbumController {
    func handleError(
      on completion: ErrorResult? = nil
    ) -> ErrorResult {
      return { error in
          completion?(error)
      }
    }
    
    func handleSuccess(
      then onComplete: VoidResult? = nil
    ) -> VoidResult {
      return { [weak self] in
          guard let self = self else { return }
          DispatchQueue.main.async {
              self.activityIndicatorView.stopAnimating()
              self.tableView.reloadData()
          }
        onComplete?()
      }
    }
}

// MARK: - Routers

private extension AlbumController {
    func navigateToDetailsScreen(at index: Int) {
        let storyboard = UIStoryboard(name: "AlbumDetails", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AlbumDetailsController") as! AlbumDetailsController
        vc.viewModel = viewModel.navigateToDetails(at: index)
        navigationController?.pushViewController(vc, animated: true)
    }
}
