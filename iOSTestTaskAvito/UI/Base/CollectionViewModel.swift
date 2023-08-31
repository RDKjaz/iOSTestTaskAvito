//
//  CollectionViewModel.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

protocol CollectionViewCellProtocol {
    func configure(with data: Any)
}

typealias CollectionViewCell = UICollectionViewCell & CollectionViewCellProtocol

struct CollectionViewModel: Equatable {
    // MARK: - Properties
    let id: String
    let data: AnyHashable
    let cellType: CollectionViewCell.Type

    // MARK: - Equatable
    static func == (lhs: CollectionViewModel, rhs: CollectionViewModel) -> Bool {
        lhs.id == rhs.id && lhs.data == rhs.data
    }
}
