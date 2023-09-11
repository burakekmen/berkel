//
//  UIColor+Extensions.swift
//  berkel
//
//  Created by Onur Yilmaz on 1.09.2023.
//

import UIKit


extension UIColor {

    // MARK: General Colors
    static var blackColor: UIColor { .black }
    static var whiteColor: UIColor { .white }
    static var orangeColor: UIColor { .orange }
    static var blueColor: UIColor { .blue }
    static var greenColor: UIColor { .green }
    static var redColor: UIColor { .red }
    static var clearColor: UIColor { .clear }
    static var brownColor: UIColor { .brown }
    static var grayColor: UIColor { .gray }
    static var lightGrayColor: UIColor { .lightGray }
    static var darkGrayColor: UIColor { .darkGray }
    static var cyanColor: UIColor { .cyan }
    static var purpleColor: UIColor { .purple }

    // MARK: AppColor
    static var primaryBlue: UIColor { .init(named: "PrimaryBlue")! }
    static var mutedBlue: UIColor { .init(named: "MutedBlue")! }

    // MARK: Gray Colors
    static var primaryDarkGray: UIColor { .init(named: "PrimaryDarkGray")! }
    static var primaryNevada: UIColor { .init(named: "PrimaryNevada")! }
    static var primaryLightGray: UIColor { .init(named: "PrimaryLightGray")! }
    static var primaryVeryLightGray: UIColor { .init(named: "PrimaryVeryLightGray")! }
    static var separatorGray: UIColor { .init(named: "SeparatorGray")! }
    static var lightGray204: UIColor { .init(named: "LightGray204")! }
    static var gray224: UIColor { .init(named: "Gray224")! }
    static var gray128: UIColor { .init(named: "Gray128")! }
    static var gray110: UIColor { .init(named: "Gray110")! }
    static var lightGray234: UIColor { .init(named: "LightGray234")! }
    
}

// MARK: Adjusting
extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage))
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage))
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage / 100, 1.0),
                           green: min(green + percentage / 100, 1.0),
                           blue: min(blue + percentage / 100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

// MARK: Init extension
extension UIColor {
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

