//
//  SwiftClasses.swift
//  InteroperabilityTest
//
//  Created by alex on 8/7/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

@objc open class SomeSwiftClass: NSObject {
    var someFloatValue: CGFloat = 400;
    var someString = "Some string"
}

@objc public enum VehicleType: NSInteger {
    case car = 0, boat = 1
}

class Vehicle: NSObject {
    let type: VehicleType

    init(type: VehicleType) {
        self.type = type
    }
}


@objc open class T: NSObject {
    static func silentSignIn(fromEndpoint: String, withCompletion: @escaping (_ success: Bool) -> ()) {
        withCompletion(true)
    }

    static var finishedSelecting: (SomeSwiftClass) -> Void = { _ in }
}
