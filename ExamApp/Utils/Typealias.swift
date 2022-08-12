//
//  Typealias.swift
//  ExamApp
//
//  Created by Valter A. Machado on 8/12/22.
//

import UIKit

// Empty Result + Void Return
typealias EmptyResult<ReturnType> = () -> ReturnType

// Custom Result + Custom Return
typealias SingleResultWithReturn<T, ReturnType> = ((T) -> ReturnType)

// Custom Result + Void Return
typealias SingleResult<T> = SingleResultWithReturn<T, Void>

// Common
typealias VoidResult = EmptyResult<Void> // () -> Void
typealias ErrorResult = SingleResult<Error> // (Error) -> Void
typealias BoolResult = SingleResult<Bool> // (Bool) -> Void

typealias TableViewDelegateDataSource = UITableViewDelegate & UITableViewDataSource
