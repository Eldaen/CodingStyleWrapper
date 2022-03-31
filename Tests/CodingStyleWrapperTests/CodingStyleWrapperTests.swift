import XCTest
@testable import CodingStyleWrapper

/// Тестовый класс
class SomeText {
	@CodingStyle(style: .camelCase) var text: String = ""
	@CodingStyle(style: .snakeCase) var text2: String = ""
	@CodingStyle(style: .kebabCase) var text3: String = ""
}

final class CodingStyleWrapperTests: XCTestCase {
	var model: SomeText!
	
	override func setUpWithError() throws {
		model = SomeText()
	}
	
	override func tearDownWithError() throws {
		model = nil
	}
	
	/// Тестируем CamelCase
	func testCamelCase() {
		// Given
		
		// When
		model.text = "SomeString to-be made_camel cased"
		
		// Then
		XCTAssertEqual(model.text, "someStringToBeMadeCamelCased")
	}
	
	/// Тестируем CamelCase
	func testSnakeCase() {
		// Given
		
		// When
		model.text2 = "SomeString to-be made_snake cased"
		
		// Then
		XCTAssertEqual(model.text2, "some-string-to-be-made-snake-cased")
	}
	
	/// Тестируем CamelCase
	func testKebabCase() {
		// Given
		
		// When
		model.text3 = "SomeString to-be made_kebab cased"
		
		// Then
		XCTAssertEqual(model.text3, "some_string_to_be_made_kebab_cased")
	}
}
