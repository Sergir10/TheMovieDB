//
//  DispatcherProtocol.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

public protocol Dispatcher {

    init(environment: Environment)
    func execute(request: Request, completion: @escaping (Any?) -> ()) throws
}
