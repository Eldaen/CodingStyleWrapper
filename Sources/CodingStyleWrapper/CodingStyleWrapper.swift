import Foundation

///Проперти враппер для приведения строк к выбранному стилю
@propertyWrapper
public struct CodingStyle {
	
	// MARK: - Variable
	
	/// Приведённая строка
	public private(set) var text: String
	
	/// Выбранный стиль
	private var currectCase: CodingStyles
	
	public var wrappedValue: String {
		get {
			get()
		}
		
		set {
			set(newValue)
		}
	}
	
	// MARK: - Init
	public init(wrappedValue: String, style: CodingStyles) {
		text = wrappedValue
		currectCase = style
	}
}

// MARK: - Private methods
private extension CodingStyle {
	
	func get() -> String {
		let text = cleanText()
		
		switch currectCase {
		case .camelCase:
			return makeCamelCase(text)
		case .snakeCase:
			return format(text, withCase: "_")
		case .kebabCase:
			return format(text, withCase: "-")
		}
	}
	
	mutating func set(_ text: String) {
		self.text = text
	}
	
	func makeCamelCase(_ text: String) -> String {
		guard !self.text.isEmpty else { return "" }
		var firstSymbol = true

		let text = text.lowercased()
			.split(separator: " ")
			.reduce("") {
				if firstSymbol {
					firstSymbol = false
					return $0 + $1
				} else {
					let firstChar = $1.first ?? Character("")
					return $0 + String(firstChar).uppercased() + String($1.dropFirst())
				}
			}
		return text
	}
	
	func format(_ text: String, withCase symbol: String) -> String {
		guard !self.text.isEmpty else { return "" }
		
		var firstSymbol = true
		let text = text.lowercased()
			.split(separator: " ")
			.reduce("") {
				if firstSymbol {
					firstSymbol = false
					return $0 + $1
				} else {
					return $0 + symbol + $1
				}
			}
		return text
	}
	
	func cleanText() -> String {
		var text = self.text
		text = text.replacingOccurrences(of: "[A-Z]", with: " $0",
										 options: .regularExpression,
										 range: text.range(of: text)
		)
		
		return String(text.map {
			($0 == "-") || ($0 == "_") ? " " : $0
		})
	}
}
