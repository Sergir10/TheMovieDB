//
//  OperationProtocol.swift
//  MovieDBTest
//
//  Created by Sergio Giraldo on 9/29/18.
//  Copyright © 2018 Sergio Giraldo. All rights reserved.
//

import Foundation

protocol Operation {
    associatedtype Output

    var request: Request? { set get }
    func execute(in dispatcher: Dispatcher, completion: @escaping (Output) -> ())
}
