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

public struct SPConstraintsAssistent {
    
    static func setEqualSizeConstraint(_ subView: UIView, superVuew: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        let topMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.topMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.top,
            multiplier: 1,
            constant: 0)
        
        let bottomMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.bottomMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1,
            constant: 0)
        
        let leadingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.leadingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1,
            constant: 0)
        
        let trailingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.trailingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1,
            constant: 0)
        
        superVuew.addConstraints([
            topMarginConstraint, bottomMarginConstraint, leadingMarginConstraint, trailingMarginConstraint
            ])
    }
    
    static func setMarginConstraint(_ subView: UIView, superVuew: UIView, top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        let topMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.topMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.top,
            multiplier: 1,
            constant: top)
        
        let bottomMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.bottomMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1,
            constant: -bottom)
        
        let leadingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.leadingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1,
            constant: leading)
        
        let trailingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.trailingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1,
            constant: -trailing)
        
        superVuew.addConstraints([
            topMarginConstraint, bottomMarginConstraint, leadingMarginConstraint, trailingMarginConstraint
            ])
    }
    
    static func setCenteringConstraint(_ subView: UIView, superView: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        
        let centerXConstraint = NSLayoutConstraint(
            item: subView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: superView,
            attribute: .centerX,
            multiplier: 1, constant: 0
        )
        
        let centerYConstraint = NSLayoutConstraint(
            item: subView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: superView,
            attribute: .centerY,
            multiplier: 1, constant: 0
        )
        
        superView.addConstraints([centerXConstraint, centerYConstraint])
    }
    
    static func setWidth(width: CGFloat, andHeight height: CGFloat, toView view: UIView) {
        let widthConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1,
            constant: width
        )
        let heightConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1,
            constant: height
        )
        view.addConstraints([widthConstraint, heightConstraint])
    }
}


       
