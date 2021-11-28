//
//  CustomClasses.swift
//  AppsLinkTask
//
//  Created by Sherif Abd El-Moniem on 27/11/2021.
//

import Foundation
import UIKit



@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var borderWidth: CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor?{
        get{
            let color = UIColor(cgColor: self.layer.borderColor!)
            return color
        }
        
        set{
            self.layer.borderColor = newValue?.cgColor
        }
    }

}


@IBDesignable
class RoundedView: UIView {
    
     
      @IBInspectable var cornerRadius: CGFloat {
          get {
              return self.layer.cornerRadius
          }
          set {
              self.layer.cornerRadius = newValue
          }
      }
    
    @IBInspectable var cornerRadiusBottomOnly: Bool  {
        get {
            return self.layer.masksToBounds
        }
        set {
            if newValue == true {
                self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            }
        }
    }
    
    @IBInspectable var cornerRadiusTopOnly: Bool  {
        get {
            return self.layer.masksToBounds
        }
        set {
            if newValue == true {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
        }
    }
    
    @IBInspectable var BorderWidth: CGFloat  {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var BorderColor: UIColor?  {
        didSet {
            self.layer.borderColor = BorderColor?.cgColor
        }
    }
      
}
