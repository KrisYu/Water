//
//  ViewController.swift
//  Water-OSX
//
//  Created by Xue Yu on 4/24/17.
//  Copyright © 2017 XueYu. All rights reserved.
//

import Cocoa
import MetalKit

class ViewController: NSViewController {
    


    var renderer: Renderer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let metalView = self.view as! MTKView
        
        let textureBtn = NSButton(frame: NSRect(x: 10, y: 10, width: 100, height: 30))
        textureBtn.title = "change texture"
        textureBtn.target = self
        textureBtn.action = #selector(textureBtnDidClick)
        view.addSubview(textureBtn)
        
        let speedLabel = NSTextField(frame: NSRect(x: 150, y: 22, width: 150, height: 30))
        speedLabel.stringValue = "change water speed"
        speedLabel.isEditable = false
        speedLabel.isSelectable = false
        speedLabel.drawsBackground = false
        speedLabel.isBezeled = false
        speedLabel.textColor = NSColor.white
        view.addSubview(speedLabel)
        
        let speedSlider = NSSlider(frame: NSRect(x: 130, y: 10, width: 150, height: 30))
        speedSlider.minValue = 0.0
        speedSlider.maxValue = 0.4
        //speedSlider.isContinuous = true
        speedSlider.target = self
        speedSlider.action = #selector(speedSliderDidChange)
        speedSlider.floatValue = 0.0
        view.addSubview(speedSlider)
        
        
        let intenseLabel = NSTextField(frame: NSRect(x: 300, y: 22, width: 150, height: 30))
        intenseLabel.stringValue = "change reflection intense"
        intenseLabel.isEditable = false
        intenseLabel.isSelectable = false
        intenseLabel.drawsBackground = false
        intenseLabel.isBezeled = false
        intenseLabel.textColor = NSColor.white
        view.addSubview(intenseLabel)
        
        
        
        let intenseSlider = NSSlider(frame: NSRect(x: 300, y: 10, width: 150, height: 30))
        intenseSlider.minValue = 0.0
        intenseSlider.maxValue = 1000.0
        //        intenseSlider.isContinuous = true
        intenseSlider.target = self
        intenseSlider.action = #selector(intenseSliderDidChange)
        intenseSlider.floatValue = 700.0
        view.addSubview(intenseSlider)
        
        
        
        
        
        renderer = Renderer(mtkView: metalView)
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func textureBtnDidClick() {
        
        guard let window = view.window else { return }
        
        let selectPicDialog = NSOpenPanel()
        selectPicDialog.prompt = "Select picture"
        selectPicDialog.worksWhenModal = true
        selectPicDialog.allowsMultipleSelection = false
        selectPicDialog.canChooseDirectories = false
        selectPicDialog.canChooseFiles = true
        selectPicDialog.resolvesAliases = true
        
        selectPicDialog.beginSheetModal(for: window) { (result) in
            if result == NSModalResponseOK {
                if let url = selectPicDialog.url{
                    self.renderer.changeTexture(imageURL: url)
                }
            }
        }
        
    }
    
    
    func speedSliderDidChange(sender: NSSlider) {
        let speedVal = sender.floatValue
        renderer.changeSpeed(speedVal: speedVal)
    }
    
    
    func intenseSliderDidChange(sender: NSSlider){
        let instenseVal = sender.floatValue
        renderer.changeIntense(intenseVal: instenseVal)
    }
    
    
}

