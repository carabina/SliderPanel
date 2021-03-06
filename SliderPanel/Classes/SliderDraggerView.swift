//
//  SliderDraggerView.swift
//  SliderPanel
//
//  Created by Sebastian Kruschwitz on 27.03.15.
//  Copyright (c) 2015 seb. All rights reserved.
//

import Foundation
import UIKit

class SliderDraggerView: UIView {

    private var draggerImageView = UIImageView()
    private var configuration = SliderConfiguration()
    
    convenience init(configuration: SliderConfiguration) {
        self.init()
        self.configuration = configuration
        
        addDraggerImageView()
    }

    private func addDraggerImageView() {
        
        draggerImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        draggerImageView.contentMode = configuration.draggerContentMode
        
        self.addSubview(draggerImageView)
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[iV]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["iV": draggerImageView]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[iV]|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["iV": draggerImageView]))
    }
    
    func displayImageForState(state: SliderState, animated: Bool) {
        
        var draggerImage: UIImage?
        
        switch (state) {
        case .Opened:
            if let image = configuration.draggerImageOpen {
                draggerImage = image
            }
            else if let image = configuration.draggerImage {
                draggerImage = image
            }
            
        case .Closed:
            if let image = configuration.draggerImageClose {
                draggerImage = image
            }
            else if let image = configuration.draggerImage {
                draggerImage = image
            }
        }
        
        if animated {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.draggerImageView.image = draggerImage
            })
        }
        else {
            self.draggerImageView.image = draggerImage
        }
        
    }
    
}