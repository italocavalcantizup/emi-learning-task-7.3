//
//  ViewController.swift
//  LearningTask-7.3
//
//  Created by rafael.rollo on 16/05/2022.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    var livrosAPI: LivrosAPI?
    
    var livros: [Livro] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
        loadLivros()
    }
    
    func loadLivros() {
        guard let livrosAPI = livrosAPI else { return }
        livros = livrosAPI.carregaLivros()
    }
}

// MARK: - UICollectionViewDataSource implementations
extension HomeViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return livros.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LivroHomeViewCell", for: indexPath) as? LivroHomeViewCell else {
            fatalError("Não foi possível obter célula para a coleção")
        }
        cell.data = livros[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return configureReusableHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        default:
            fatalError("Tipo de view suplementar não suportado: \(kind)")
        }
    }
    
    func configureReusableHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeSectionHeaderView", for: indexPath) as? HomeSectionHeaderView else {
            fatalError("Não foi possível obter a view suplementar para a lista de livros")
        }
        header.titulo = "Todos os Livros"
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout implementations
extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("É esperado que a lista de livros trabalhe com base em UICollectionViewFlowLayout")
        }

        let itemsPerLine: CGFloat = 2
        let margins = flowLayout.sectionInset
        let itemsSpacing = flowLayout.minimumInteritemSpacing

        let utilWidth = collectionView.bounds.width
                        - (margins.left + margins.right)
                        - itemsSpacing * (itemsPerLine - 1)
        let itemWidth = utilWidth / itemsPerLine

        return CGSize(width: itemWidth, height: itemWidth * 1.41 + 48)
    }
}
