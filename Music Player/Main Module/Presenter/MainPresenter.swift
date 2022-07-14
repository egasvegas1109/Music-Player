//
//  MainPresenter.swift
//  Music Player
//
//  Created by Егор Тютюкин on 13.05.2022.
//

import Foundation
import AVFoundation
import MediaPlayer

protocol MainViewProtocol: AnyObject{ //протокол для отправки
    func setStatus(statusMusic: String)
    func setMusicName(musicName: String)
}

protocol MainViewPresenterProtocol: AnyObject{ //протокол для приёма
    init(view: MainViewProtocol, model: Music)
    func playAndStop()
    func initAV(initPlayer: Bool)
}

class MainPresenter: MainViewPresenterProtocol{
    var player: AVAudioPlayer?
    var initPlayer: Bool = false

    required init(view: MainViewProtocol, model: Music) {
        self.view = view
        self.model = model
    }
    
    let view: MainViewProtocol
    var model: Music
    
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
            model.statusMusic = "Play"
            view.setStatus(statusMusic: model.statusMusic)
            
            player.pause()
        }
        else
        {
            //музыка не играет
            initAV(initPlayer: initPlayer)//инициализация плеера
            
            model.musicName = "PHARAOH - Unname"
            view.setMusicName(musicName: model.musicName)
            
            model.statusMusic = "Stop"
            view.setStatus(statusMusic: model.statusMusic)
            
            player!.play()
        }
    }
}
