# Water

Simple calculation to render cheap water effects.

[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/) [![License MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/Carthage/Carthage)

This simple project demonstrates :

1. how to use Metal draw compute shader, or known as 'kernal function'.
2. share code between iOS/OSX, both targets are built in the same project.



Demo - Mac

![Mac](https://github.com/KrisYu/Water/blob/master/mac.gif?raw=true)

Demo - iPhone

![iPhone](https://github.com/KrisYu/Water/blob/master/iphone.gif?raw=true)


## Build and Run

Choose to run OSX or iOS version.

**Notice: iOS simulator doesnot support Metal framework, you have to run it on a real A7 iPhone.**

![](https://github.com/KrisYu/Water/blob/master/run.png?raw=true)


## Thanks

This is an experiment with Apple Swift/Metal shading language. Bascially I just port this [WebGL shadertoy](https://www.shadertoy.com/view/4slGRM) to Metal.


- Special thanks to Victor Korsun for letting me use his shader code 
- [http://metalkit.org](http://metalkit.org) for all the nice tutorials 