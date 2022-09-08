//
//  UnitTestCaseTests.swift
//  UnitTestCaseTests
//
//  Created by Purva Ruparelia on 07/09/22.
//

import XCTest
@testable import UnitTestCase

class UnitTestCaseTests: XCTestCase {
    
    // MARK: Variables
    var viewModel : UserViewModel!
    
    // MARK: XCTest methods
    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = UserViewModel()
    }

    override func tearDownWithError() throws {
       try super.tearDownWithError()
        viewModel = nil
    }

    // MARK: Test case methods
    func testEmptyFname() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "", age: 19, email: "purva@grr.la", password: "Purva@123")), "Empty first name")
    }
    
    func testAgeLimit() throws {
        XCTAssertNoThrow(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 5, email: "purva@grr.la", password: "Purva@123")))
    }
    
    func testEmptyEmail() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 19, email: "", password: "Purva@123")), "Empty email")
    }
    
    func testValidEmail() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 19, email: "purva@", password: "Purva@123")), "Email not valid")
    }
    
    func testEmptyPassword() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 19, email: "purva@grr.la", password: "")), "Empty Password")
    }
    
    func testValidPassword() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 19, email: "purva@grr.la", password: "purva")), "Password must be six characters long and must contain one uppercase letter, lowercase letter, digit and special character")
    }
  
    func testValidPassword1() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 19, email: "purva@grr.la", password: "Purva123")), "Password must be six characters long and must contain one uppercase letter, lowercase letter, digit and special character")
    }
    
    func testSuccess() {
        XCTAssertTrue(try viewModel.validation(userModel: UserModel(firstName: "Purva", age: 19, email: "purva@grr.la", password: "Purva@123")), "Test succeed")
    }

}
