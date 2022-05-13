//
//  ModuleBuilder.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import Foundation
import UIKit

protocol Builder{
    static func createMainModule() -> UIViewController
}

class ModelBuilder:Builder{
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Egor", lastName: "Tyutyukin")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, preson: model)
        
        view.presenter = presenter
        return view
    }
    
    
}
