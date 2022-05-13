//
//  MainPresenter.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import Foundation

protocol MainViewProtocol: AnyObject{ //протокол для отправки
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject{ //протокол для приёма
    init(view: MainViewProtocol, preson: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol{
    
    required init(view: MainViewProtocol, preson: Person) {
        self.view = view
        self.person = preson
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
    let view: MainViewProtocol
    let person: Person
    
    
}
