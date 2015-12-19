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

class BlurView: UIView {
    
    var effectView: UIView?
    private var shadowPercent: CGFloat = 0.65
    
    func createBlurWithStyle(style: Style) {
        if #available(iOS 8.0, *) {
            if UIAccessibilityIsReduceTransparencyEnabled() {
                self.effectView = createShadowViewWithStyle(style)
            } else {
                self.effectView = createBlurViewWithStyle(style)
            }
        } else {
            self.effectView = createShadowViewWithStyle(style)
        }
        self.addSubview(effectView!)
    }
    
    private func createBlurViewWithStyle(style: Style) -> UIView {
        if #available(iOS 8.0, *) {
            var blurStyle: UIBlurEffectStyle!
            switch style {
            case .Dark:
                blurStyle = UIBlurEffectStyle.Dark
            case .Light:
                blurStyle = UIBlurEffectStyle.Light
            case .ExtraLight:
                blurStyle = UIBlurEffectStyle.ExtraLight
            }
            let blurEffect = UIBlurEffect(style: blurStyle)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            return blurEffectView
        } else {
            return UIView()
        }
    }
    
    private func createShadowViewWithStyle(style: Style) -> UIView {
        let view = UIView()
        var color: UIColor!
        switch style {
        case .Dark:
            color = UIColor.blackColor()
        case .Light:
            color = UIColor.whiteColor()
        case .ExtraLight:
            color = UIColor.whiteColor()
            self.shadowPercent = self.shadowPercent + (self.shadowPercent * 0.3)
        }
        view.backgroundColor = color
        view.alpha = self.shadowPercent
        return view
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.effectView?.frame = self.bounds
    }
    
    enum Style {
        case Dark
        case Light
        case ExtraLight
    }
}