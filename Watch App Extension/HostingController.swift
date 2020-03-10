//
//  HostingController.swift
//  Watch App Extension
//
//  Created by Julian Schiavo on 8/3/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<BaseView> {
    override var body: BaseView {
        return BaseView()
    }
}
