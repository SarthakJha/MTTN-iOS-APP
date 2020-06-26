//
//  RightEarMask.swift
//  LoginCritter
//
//  Created by Christopher Goldsby on 4/15/18.
//  Copyright © 2018 Christopher Goldsby. All rights reserved.
//

import UIKit

final class RightEarMask: UIImageView, CritterAnimatable {

    convenience init() {
        self.init(image: UIImage.Critter.head)
        layer.anchorPoint = CGPoint(x: 0, y: 0)
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        guard let superview = superview else { return }

        frame = superview.bounds
        mask = {
            let mask = UIView()
            mask.backgroundColor = .black
            var frame = superview.bounds
            frame.origin.x = frame.midX
            frame.size.width = frame.width / 2
            mask.frame = frame
            return mask
        }()
    }

    // MARK: - CritterAnimatable

    @objc func applyActiveStartState() {
        layer.transform = CATransform3D
            .identity
            .scale(.x, by: 0.82)
    }

    @objc func applyActiveEndState() {
        layer.transform = .identity
    }
}
