![](https://www.dropbox.com/s/dsgrkzwnj547j6s/sparrow.png?dl=0)

## Description
A library to simplify iOS programming in Swift.

## Installation
Drop in the Sparrow folder to your Xcode project.

![](http://f.cl.ly/items/1p2i1n413f0A0R1P0j0T/installation.jpg)

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

![](http://f.cl.ly/items/443E2R0B0b0h1Z351K20/banner.jpg)

## Sound

    var audio = audioPlayer(fileName: "sparrow.mp3")
    audio.play()

or else

    var audio = audioPlayer()
    audio.playSound("sparrow.mp3")
    audio.playSound("colibri.wav")

## Detailed Report

![](http://f.cl.ly/items/3O201E280q3a2h3B0d0Z/log.jpg)

## License
Sparrow is released under the MIT license. See LICENSE.md for details.