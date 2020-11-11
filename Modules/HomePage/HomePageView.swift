//
//  HomePageView.swift
//  HeroesByLeo
//
//  Created by Leo on 06/11/20.
//

import Foundation
import UIKit

protocol IHomePageView: class {
    var router: IHomePageRouter? { get set }
    func displayHeroes(heroes: [Hero.Response])
    func displayErrorGetHeroes()
    func displayAvailableFilters(filters: [String])
    func displayRelatedHeroes(related: [Hero.Response], selectedHero: Hero.Response)
}

class HomePageView: UIViewController {
    var router: IHomePageRouter?
    var interactor: IHomePageInteractor?
    @IBOutlet weak var filterTable: UITableView!
    @IBOutlet weak var heroCollection: UICollectionView!
    @IBOutlet weak var tableViewWidthAnchor: NSLayoutConstraint!
    private var refreshControl: UIRefreshControl?
    private var heroes = [Hero.Response]()
    private var filterItem = [String]()
    private let heroPadding = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    private var heroCellSize: CGSize {
        switch self.orientation {
        case .landscape:
            let baseSize = (UIScreen.main.bounds.size.width - tableViewWidthAnchor.constant - (heroPadding.left * 2)) / 6
            return CGSize(width: baseSize, height: baseSize)
        default:
            let baseSize = (UIScreen.main.bounds.size.width - tableViewWidthAnchor.constant - (heroPadding.left * 2)) / 3
            return CGSize(width: baseSize, height: baseSize)
        }
    }

    override func viewDidLoad() {
        title = "All"
        interactor?.fetchAllHeroes()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        guard let flowLayout = heroCollection.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.invalidateLayout()
    }

    private func setupView() {
        setupTableView()
        setupCollectionView()
    }

    private func setupTableView() {
        filterTable.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        filterTable.estimatedRowHeight = 50
        filterTable.rowHeight = UITableView.automaticDimension
        filterTable.separatorStyle = .none
        filterTable.dataSource = self
        filterTable.delegate = self
        filterTable.register(UINib(nibName: FilterTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FilterTableViewCell.identifier)
    }

    private func setupCollectionView() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(collectionPullTrigger), for: .valueChanged)
        self.refreshControl = refreshControl
        heroCollection.addSubview(refreshControl)
        heroCollection.dataSource = self
        heroCollection.delegate = self
        heroCollection.register(UINib(nibName: HeroCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HeroCollectionViewCell.identifier)
    }

    @objc private func collectionPullTrigger() {
        title = "All"
        interactor?.fetchAllHeroes()
    }
}

extension HomePageView: IHomePageView {
    func displayHeroes(heroes: [Hero.Response]) {
        self.heroes = heroes
        interactor?.getAvailableFilter()
        heroCollection.reloadData()
        filterTable.reloadData()
        refreshControl?.endRefreshing()
    }

    func displayErrorGetHeroes() {
        print("Error get data")
    }

    func displayAvailableFilters(filters: [String]) {
        self.filterItem = filters
        filterTable.reloadData()
    }

    func displayRelatedHeroes(related: [Hero.Response], selectedHero: Hero.Response) {
        router?.navigateToDetail(relatedHeroes: related, selectedHero: selectedHero)
    }
}

extension HomePageView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterItem.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FilterTableViewCell.identifier, for: indexPath) as? FilterTableViewCell else { fatalError("Cell Not Found") }
        cell.setup(value: filterItem[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        title = self.filterItem[indexPath.row]
        interactor?.fetchHeroes(by: self.filterItem[indexPath.row])
    }
}

extension HomePageView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = self.heroes[indexPath.row]
        interactor?.getRelatedHeroes(by: selectedItem)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCollectionViewCell.identifier, for: indexPath) as? HeroCollectionViewCell else { fatalError("Cell Not Found") }
        cell.setup(hero: heroes[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return heroCellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return heroPadding
    }
}
