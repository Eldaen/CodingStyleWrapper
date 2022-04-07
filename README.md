# CodingStyleWrapper

Данная библиотека позволяет автоматический конвертировать строки, помеченные как `@CodingStyle` в нужный вам стиль.
В данный момент доступны `Camel case`, `Snake case` и `Kebab case`

## Использование

```Swift
class someText {
	@CodingStyle(style: .camelCase) var text: String = ""
	@CodingStyle(style: .snakeCase) var text2: String = ""
	@CodingStyle(style: .kebabCase) var text3: String = ""
}

let textClass = someText()
textClass.text = "SomeString to-be made_camel cased"
textClass.text2 = "SomeString to-be made_snake cased"
textClass.text3 = "SomeString to-be made_kebab cased"
print(textClass.text)     //someStringToBeMadeCamelCased
print(textClass.text2)    //some-string-to-be-made-snake-cased
print(textClass.text3)    //some_string_to_be_made_kebab_cased
```

## Установка

Данный package можно установть через `Package Manager` в Xcode.
File - Add package - и там вставляете ссылку на этот репозиторий


