//
//  Router.swift
//  iOSTestTaskAvito
//
//  Created by Radik Gazetdinov on 29.08.2023.
//

import UIKit

@MainActor protocol Router {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilder? { get set }
    
    func initial()
    func showDetail(id: String)
}
