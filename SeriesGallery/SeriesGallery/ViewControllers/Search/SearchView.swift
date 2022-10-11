//
//  ViewController.swift
//  SeriesGallery
//
//  Created by Jully Nobre da Silva on 08/10/22.
//

import UIKit

class SearchViewController: AppController {
    
    private lazy var resultsTable: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 80
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let searchController = UISearchController()
    
    private let viewModel: SearchViewModel
    private let cellIndentifier = "SearchResultCell"
    
    // MARK: - Inits
    
    required init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init()
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ViewSetup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        
        resultsTable.register(SearchResultCell.self, forCellReuseIdentifier: cellIndentifier)
    }
    
    func setupLayout() {
        self.view.addSubview(resultsTable)
        
        NSLayoutConstraint.activate([
            resultsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            resultsTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            resultsTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            resultsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}


// MARK: - TableView

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? SearchResultCell
        else { return UITableViewCell() }
        
        let result = viewModel.getInfo(for: indexPath)
        cell.serieNameLabel.text = result.name
        cell.serieImage.image = result.image
        
        return cell
    }
    
}


// MARK: - SearchBar

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        viewModel.searchSeries(query: searchBar.text ?? "")
    }
}


extension SearchViewController: RequestDelegate {
    func didUpdate(with state: ViewState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            switch state {
            case .idle:
                break
            case .loading:
                //start loading animation
                print("loading")
            case .success:
                self.resultsTable.reloadData()
                //stop loading
            case .relaodRow(let indexPath):
                self.resultsTable.reloadRows(at: [indexPath], with: .none)
            case .error(let error):
                //stop loading and show error
                print(error)
                //relaod data (initial state)
            }
        }
    }
    
    
}
