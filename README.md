![](/Img/sparrow.jpg)

## Description
The library for simplify iOS programming in Swift. Сode written by sticking paradigms Steve McConnell in his book "Сode Сomplete". 

I think that programmist at first think about the idea, and only then on the implementation. In library collected routine actions, which every programmist must realesed and realesed. Programmis shoud do product, but implementation simply action as "Inn-App" or "How play sound".

Now added Game Center, In-App Purchase, AudioPlayer and other.

## Installation
Drop in the Sparrow folder to your Xcode project. Add some lines of code and it work! 

![](/Img/installation.jpg)

## In-App Purchase

    var purchase = Product(productID: "insert_in-app_id")
    purchase.funcWithPurchased = {
        println("bought")
    }
    buy(purchase)

## Game Center

    authorizateInGameCenter()
    saveHighscore(30, toLiderboard: "LiderboardID")
    showLeaderboard("LeaderboardID")

# Achivment

    let achivment = Achivment(ID: "insert_achivment_id")
    achivment.setPercentCompleteTo(80)
    achivment.sendAchivmentToServer()

or else

    sendAchivmentToServer([achivment_1, achivment_2])

# Banner GC

    showNotificationBannerWithTitle("Sparrow", messege: "Simplify iOS programming")

![](/Img/banner GameCenter.jpg)

## Sound

    var sparrowSound = AudioPlayer(fileName: "sparrow.mp3")
    sparrowSound.play()

or else

    var audio = AudioPlayer()
    audio.playSound("sparrow.mp3")
    audio.playSound("colibri.wav")

## Detailed Report

During the execution of each complex action you will receive a detailed report to the console It is necessary to control: for example, you make a mistake in entering the ID of the internal purchases.

![](/Img/log.jpg)

## License and Contact
Sparrow is released under the MIT license. See LICENSE.md for details.

Contact:
 
    ivanvorobei@icloud.com
    www.ivanorobei.by
    www.facebook.com/ivanvorobeisparrow
    
![](/Img/feature.jpg)