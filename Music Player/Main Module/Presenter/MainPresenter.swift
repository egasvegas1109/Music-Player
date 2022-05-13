//
//  MainPresenter.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import Foundation
import AVFoundation

protocol MainViewProtocol: AnyObject{ //протокол для отправки
    func setStatus(statusMusic: String)
}

protocol MainViewPresenterProtocol: AnyObject{ //протокол для приёма
    init(view: MainViewProtocol, music: Music)
    func playAndStop()
    func initAV(initPlayer: Bool)
}

class MainPresenter: MainViewPresenterProtocol{
    
    var player: AVAudioPlayer?
    var initPlayer: Bool = false
    
    required init(view: MainViewProtocol, music: Music) {
        self.view = view
        self.music = music
    }
    
    let view: MainViewProtocol
    var music: Music
    
    func initAV(initPlayer: Bool)
    {
        if(!initPlayer)
        {
            let urlString = Bundle.main.path(forResource: "PHARAOH", ofType: "mp3")
            
            do
            {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString!))

            }
            catch
            {
                print("error")
            }
            
            self.initPlayer = true
        }
    }
    
    func playAndStop() {
        if let player = player, player.isPlaying {
            
            //музыка играет
            music.statusMusic = "Play"
            self.view.setStatus(statusMusic: music.statusMusic)
            player.pause()
        }
        else
        {
            //музыка не играет
            initAV(initPlayer: initPlayer)//инициализация плеера
            
            music.statusMusic = "Stop"
            self.view.setStatus(statusMusic: music.statusMusic)
            player!.play()
        }
    }
}
