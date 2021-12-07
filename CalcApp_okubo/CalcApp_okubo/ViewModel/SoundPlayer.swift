//
//  SoundPlayer.swift
//  CalcApp_okubo
//
//  Created by 大久保徹郎 on 2021/11/26.
//

import SwiftUI
import AVFoundation

class SoundPlayer {
    /// 丸いボタンのタップ音
    private var circleTap: AVAudioPlayer?
    private let circleTapStr = ["button01", "button02", "button03"]
    //最後に使用した丸いボタンのタップ音
    private var circleTap_last = ""
    /// =ボタンのタップ音
    private var equalSound: AVAudioPlayer?
    ///クリアボタンのタップ音
    private var clearSound: AVAudioPlayer?
    
    // MARK: - メソッド
    ///丸いボタンのサウンドを再生する関数
    func circleTap_play(sound: String) {
        print("前回使用した音: \(circleTap_last)")
        //前回使用したものと同じサウンドか判定
        if circleTap_last == sound {
            //circleTapのインスタンスが既にあるか判定
            if let numberTap = circleTap {
                //リセット
                numberTap.stop()
                numberTap.currentTime = 0.0
                print("circleTap: リセット")
            }
        } else {
            let soundData = NSDataAsset(name: sound)!.data
            circleTap = try? AVAudioPlayer(data: soundData)
            print("circleTap: インスタンス作成")
            //使用したサウンドを記憶
            circleTap_last = sound
        }
        //再生
        circleTap?.play()
    }
    ///＝ボタンのサウンドを再生する関数
    func equalSound_play() {
        //equalSoundのインスタンスが既にあるか判定
        if let equalSound = equalSound {
            //リセット
            equalSound.stop()
            equalSound.currentTime = 0.0
        } else if let soundData = NSDataAsset(name: "equal")?.data {
            equalSound = try? AVAudioPlayer(data: soundData)
            print("初回")
        }
        //再生
        equalSound?.play()
    }
    /// クリアボタンのサウンドを再生する関数
    func clearSound_play() {
        if let clearSound = clearSound {
            //リセット
            clearSound.stop()
            clearSound.currentTime = 0.0
        } else if let soundData = NSDataAsset(name: "clear")?.data {
            clearSound = try? AVAudioPlayer(data: soundData)
            print("初回")
        }
        //再生
        clearSound?.play()
    }
}
