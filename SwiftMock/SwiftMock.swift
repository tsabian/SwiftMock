//
//  SwiftMock.swift
//  SwiftMock
//
//  Created by Tiago Oliveira on 24/09/21.
//

import Foundation

protocol SwiftMockProtocol {
    associatedtype InstanceTarget

    typealias When = (InstanceTarget) -> Void

    func setup<TResult: Any>(call: Selector, thenReturn value: TResult)
    func setup(call: When, throw error: Error)
}

public class SwiftMock<T: AnyObject> {

    public typealias When = (T) -> Void

    init() { }

    public func setup<TResult: Any>(call: When, thenReturn value: TResult) {
    }

    public func setup(call: When, throw error: Error) {
    }
}
