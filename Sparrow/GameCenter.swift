// The MIT License (MIT)
//
// Copyright (c) 2015 Ivan Vorobei (ivanvorobei@icloud.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import GameKit

class GameCenterManager: NSObject, GKGameCenterControllerDelegate {
    
    var rootViewController: UIViewController!
    
    init(rootViewController: UIViewController) {
        super.init()
        self.rootViewController = rootViewController
    }
    
    //MARK: - authorizate
    func authorizateInGameCenter() {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {(viewController, errors) -> Void in
            guard (viewController != nil) else {
                print("Game Center - Faild authorizate in GameCenter")
                print("State authenticate GameCenter: " + String((GKLocalPlayer.localPlayer().authenticated)))
                print("Mistakes: " + String(errors!.localizedDescription))
                return
            }
            self.rootViewController.presentViewController(viewController!, animated: true, completion: nil)
        }
    }
    
    //MARK: - leaderboard
    func showLeaderboard(LiderboardID: String) {
        let gcViewController: GKGameCenterViewController = GKGameCenterViewController()
        gcViewController.gameCenterDelegate = self
        gcViewController.viewState = GKGameCenterViewControllerState.Leaderboards
        gcViewController.leaderboardIdentifier = LiderboardID
        self.rootViewController.presentViewController(gcViewController, animated: true, completion: nil)
    }
    
    func saveHighscore(score: Int, toLiderboard LiderboardID: String) {
        guard GKLocalPlayer.localPlayer().authenticated else {
            print("Game Center - Faild saved highscore. State authenticate GameCenter: " + String((GKLocalPlayer.localPlayer().authenticated)))
            return
        }
        let scoreReporter = GKScore(leaderboardIdentifier: LiderboardID)
        scoreReporter.value = Int64(score)
        let scoreArray: [GKScore] = [scoreReporter]
        GKScore.reportScores(scoreArray) { (errors) -> Void in
            guard (errors != nil) else {
                print("Game Center - Faild saved highscore to LiderboardID: " + String(LiderboardID))
                print("Mistakes: " + String(errors!.localizedDescription))
                return
            }
            print("Game Center - Sucsess saved highscore to LiderboardID: " + String(LiderboardID))
        }
    }
    
    //MARK: - achivment
    func sendAchivmentToServer(achivments: [Achivment]) {
        var gkAchivments = [GKAchievement]()
        for achivment in achivments {
            gkAchivments.append(achivment.gkAchivment)
        }
        GKAchievement.reportAchievements(gkAchivments, withCompletionHandler: nil)
    }
    
    func resetAchivments() {
        GKAchievement.resetAchievementsWithCompletionHandler {(errors) -> Void in
            guard (errors != nil) else {
                print("Game Center - Faild reset achivments")
                print("Mistakes: " + String(errors!.localizedDescription))
                return
            }
            print("Game Center - Reset Achivment")
        }
    }
    
    //MARK: - notification banner
    func showNotificationBannerWithTitle(title: String, messege: String) {
        GKNotificationBanner.showBannerWithTitle(title, message: messege, completionHandler: nil)
    }
    
    internal func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

class Achivment {
    
    let ID: String!
    private let gkAchivment: GKAchievement!
    
    init(ID: String) {
        self.ID = ID
        self.gkAchivment = GKAchievement(identifier: ID)
    }
    
    func setPercentCompleteTo(percent: Double) {
        self.gkAchivment.percentComplete = percent
    }
    
    func sendAchivmentToServer() {
        GKAchievement.reportAchievements([self.gkAchivment], withCompletionHandler: {(errors) -> Void in
            guard (errors != nil) else {
                print("Game Center - Faild send achivment to server")
                print("Mistakes: " + String(errors!.localizedDescription))
                return
            }
            print("Game Center - Sent achivment to server")
        })
    }
}