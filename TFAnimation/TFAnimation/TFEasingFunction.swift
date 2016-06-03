//
//  TFAnimationFunction.swift
//  UIViewAnimation
//
//  Created by Luo on 6/3/16.
//  Copyright © 2016 Luo. All rights reserved.
//

import UIKit

typealias TFEasingFunction = TFBasicAnimationFunction

infix operator ^^ { }
func ^^ (radix: CGFloat, power: CGFloat) -> CGFloat {
    return CGFloat(pow(Double(radix), Double(power)))
}

let TFEasingFunctionLinear:TFEasingFunction = {
    $0
}

let TFEasingFunctionEaseInQuad:TFEasingFunction = {
    $0 ^^ 2
}

let TFEasingFunctionEaseOutQuad:TFEasingFunction = {
    $0 * (2 - $0)
}

let TFEasingFunctionEaseInOutQuad:TFEasingFunction = {
    if ($0 < 0.5) {
        return 2 * $0 * $0
    } else {
        return -1 + (4 - 2 * $0) * $0
    }
}

let TFEasingFunctionEaseInCubic:TFEasingFunction = {
    $0 ^^ 3
}

let TFEasingFunctionEaseOutCubic:TFEasingFunction = {
    ($0 - 1) ^^ 3 + 1
}
    
let TFEasingFunctionEaseInOutCubic:TFEasingFunction = {
    if ($0 < 0.5) {
        return 4 * ($0 ^^ 3)
    } else {
        return ($0 - 1) * ((2 * $0 - 2) ^^ 2) + 1;
    }
}

let TFEasingFunctionEaseInQuart:TFEasingFunction = {
    $0 ^^ 4
}

let TFEasingFunctionEaseOutQuart:TFEasingFunction = {
    1 - (($0 - 1) ^^ 4)
}

let TFEasingFunctionEaseInOutQuart:TFEasingFunction = {
    if ($0 < 0.5) {
        return 8 * ($0 ^^ 4)
    } else {
        return -1 / 2 * ((2 * $0 - 2) ^^ 4) + 1
    }
}

let TFEasingFunctionEaseInBounce:TFEasingFunction = {
    return 1.0 - TFEasingFunctionEaseOutBounce(1.0 - $0)
}

let TFEasingFunctionEaseOutBounce:TFEasingFunction = {
    if ($0 < 4.0 / 11.0) {
        return pow(11.0 / 4.0, 2) * pow($0, 2)
    }
    if ($0 < 8.0 / 11.0) {
        return 3.0 / 4.0 + pow(11.0 / 4.0, 2) * pow($0 - 6.0 / 11.0, 2)
    }
    if ($0 < 10.0 / 11.0) {
        return 15.0 / 16.0 + pow(11.0 / 4.0, 2) * pow($0 - 9.0 / 11.0, 2)
    }
    return 63.0 / 64.0 + pow(11.0 / 4.0, 2) * pow($0 - 21.0 / 22.0, 2)
}

let TFEasingFunctionEaseInExpo:TFEasingFunction = {
    return $0 == 0 ? 0.0 : (2 ^^ (10 * ($0 - 1)))
}

let TFEasingFunctionEaseOutExpo:TFEasingFunction = {
    return $0 == 1.0 ? 1 : 1 - ( 2 ^^ ( -10 * $0))
}

let TFEasingFunctionEaseInOutExpo:TFEasingFunction = {
    if ($0 == 0) {
        return 0.0
    }
    if ($0 == 1) {
        return 1.0
    }
    if ($0 < 0.5) {
        return (2 ^^ (10 * (2 * $0 - 1))) / 2;
    } else {
        return 1 - (2 ^^ (-10 * (2 * $0 - 1))) / 2;
    }
}

func TFEasingFunctionEaseSin(Period:Int) -> TFEasingFunction {
    return {
        -CGFloat(sin(2.0 * M_PI * Double(Period) * Double($0)))
    }
}


