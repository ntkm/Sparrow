// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
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

// MARK: - convertToImage
public extension UIView {
    
    func convertToImage() -> UIImage {
        return UIImage.drawFromView(view: self)
    }
}

// MARK: - gradeView
public extension UIView {
    
    func addGrade(alpha: CGFloat, color: UIColor = UIColor.black) {
        let gradeView = UIView.init()
        gradeView.alpha = 0
        self.addSubview(gradeView)
        SPConstraintsAssistent.setEqualSizeConstraint(gradeView, superVuew: self)
        gradeView.alpha = alpha
        gradeView.backgroundColor = color
    }
    
    func setShadow(
        xTranslationFactor: CGFloat = 0,
        yTranslationFactor: CGFloat = 0.1,
        widthRelativeFactor: CGFloat = 0.8,
        heightRelativeFactor: CGFloat = 0.9,
        blurRadius: CGFloat = 5,
        shadowOpacity: Float = 0.35)
    {
        
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        let yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let shadowPath = UIBezierPath.init(rect:
            CGRect.init(
                x: xTranslation,
                y: yTranslation,
                width: shadowWidth,
                height: shadowHeight
            )
        )
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath
    }
}

