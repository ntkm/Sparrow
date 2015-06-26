![](http://f.cl.ly/items/1W1t1v1V2e2G1A471u1p/sparrow.jpg)

## Description
A library to simplify iOS programming in Swift.

## Installation
Drop in the Sparrow folder to your Xcode project.

![](http://f.cl.ly/items/2Z3Q2e3d0h0O3M1v2n2k/installation.jpg)

## In-App Purchase

    var purchase = Product(productID: "ID")
    purchase.funcWithPurchased = {
        println("Bought")
    }
    buy(purchase)

## Game Center

    authorizateInGameCenter()
    saveHighscore(30, toLiderboard: "LiderboardID")
    showLeaderboard("LeaderboardID")

# Achivment

    var achivment = createAchivment("achivmentID")
    achivment.setPercentCompleteTo(100)
    sendAchivmentToServer([achivment])

# Banner

    showNotificationBannerWithTitle("Sparrow", messege: "Simplify iOS programming")

![](http://f.cl.ly/items/0T1T3y1H1n0V1w2U0P01/banner.jpg)

## Sound

    var audio = audioPlayer(fileName: "sparrow.mp3")
    audio.play()

or else

    var audio = audioPlayer()
    audio.playSound("sparrow.mp3")
    audio.playSound("colibri.wav")

## Detailed Report

![](http://f.cl.ly/items/2u3p451Q3P1x2B390P2L/log.jpg)

## License
Sparrow is released under the MIT license. See LICENSE.md for details.