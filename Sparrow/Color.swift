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

class HSBColor {
    
    var hue: CGFloat = 0
    var saturation: CGFloat = 0
    var brightness: CGFloat = 0
    
    init(hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
        self.hue = hue
        if (self.hue > 1) {
            println("Error init HSB Color: overload hue. Set count < 1")
        }
        self.saturation = saturation
        self.brightness = brightness
    }
    
    func getUIColor() -> UIColor {
        return UIColor(hue: self.hue, saturation: self.saturation, brightness: self.brightness, alpha: 1.0)
    }
    
    func addModul(modul: HSBColor) {
        self.addModul(hue: modul.hue, saturation: modul.saturation, brightness: modul.brightness)
    }
    
    func addModul(#hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
        self.hue = self.hue + hue
        if (self.hue > 1) {
            self.hue = self.hue - 1
        }
        if (self.hue < 0) {
            self.hue = self.hue + 1
        }
        self.saturation = self.saturation + saturation
        self.brightness = self.brightness + brightness
    }
}

func insertGradienInView(view: UIView, firstColor: UIColor, secondColor: UIColor) {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.colors = [firstColor.CGColor, secondColor.CGColor]
    gradient.locations = [0.0 , 1.0]
    gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
    gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
    gradient.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.size.width, height: view.frame.size.height)
    view.layer.insertSublayer(gradient, atIndex: 0)
}