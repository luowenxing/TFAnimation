# TFAnimation
The `timingFunction` of `CAAnimation` only allow us create a named or cubic-bezier `CAMediaTimingFunction`.Now the `TFAnimation` is a light weight implementation which enhance `CABasicAnimation` with custom `timingFunction` whose domain should be between 0 and 1 like cubic-bezier.

# Demo
![A simple sin curve like animation](https://github.com/luowenxing/TFAnimation/blob/master/TFAnimation/Demo/demo.gif?raw=true)

A simple sin curve like animation with timingFunction of f(t) = sin (4π * t)

# Usage
* Drag TFAnimation folder to your project
* Use it just as CABasicAnimation except assign `timeFunction` with a block `(CGFloat) -> CGFloat` rather than assign `timingFunction`
```
let animationY = TFBasicAnimation()
animationY.keyPath = "position.y"
animationY.fromValue = 0
animationY.byValue = height / 4
animationY.duration = 5.0
animationY.timeFunction = {
  t in 
  return t * t
}
```
* There are some pre-defined time function for convience,see `TFEasingFunction.swift`.

# Reference & Inspired
[animations-explained](https://www.objc.io/issues/12-animations/animations-explained/)
[RBBAnimation](https://github.com/robb/RBBAnimation)
