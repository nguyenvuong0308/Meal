//
//  CustomTableViewCellTests.swift
//  CustomTableViewCellTests
//
//  Created by NTQ on 6/12/19.
//  Copyright © 2019 NTQ. All rights reserved.
//

import XCTest
@testable import CustomTableViewCell

class CustomTableViewCellTests: XCTestCase {

    //MARK: Meal Class Tests
    // Confirm that the Meal initializer returns a Meal object when passed valid parameters.
    func testMealInitializationSucceeds() {
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
}
