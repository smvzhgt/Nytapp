//
//  ModuleBuilderProtocol.swift
//  Nytapp
//
//  Created by oleg on 30.05.2020.
//  Copyright © 2020 Nytapp. All rights reserved.
//

import UIKit

protocol ModuleBuilder: class {
    func build() -> UIViewController
}
