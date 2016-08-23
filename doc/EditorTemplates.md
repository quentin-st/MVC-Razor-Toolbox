# EditorTemplates
EditorTemplates are supplied for the following types:

 - [Boolean](../content/Modules/Shared/Views/Partial/EditorTemplates/Boolean.cshtml.pp)
 - [Currency](../content/Modules/Shared/Views/Partial/EditorTemplates/Currency.cshtml.pp)
 - [Date](../content/Modules/Shared/Views/Partial/EditorTemplates/Date.cshtml.pp)
 - [DateTime](../content/Modules/Shared/Views/Partial/EditorTemplates/DateTime.cshtml.pp)
 - [Decimal](../content/Modules/Shared/Views/Partial/EditorTemplates/Decimal.cshtml.pp)
 - [DropDown](../content/Modules/Shared/Views/Partial/EditorTemplates/DropDown.cshtml.pp)
 - [EmailAddress](../content/Modules/Shared/Views/Partial/EditorTemplates/EmailAddress.cshtml.pp)
 - [Enum](../content/Modules/Shared/Views/Partial/EditorTemplates/Enum.cshtml.pp)
 - [HttpPostedFileBase](../content/Modules/Shared/Views/Partial/EditorTemplates/HttpPostedFileBase.cshtml.pp)
 - [Int32](../content/Modules/Shared/Views/Partial/EditorTemplates/Int32.cshtml.pp)
 - [MultilineText](../content/Modules/Shared/Views/Partial/EditorTemplates/MultilineText.cshtml.pp)
 - [Password](../content/Modules/Shared/Views/Partial/EditorTemplates/Password.cshtml.pp)
 - [Single](../content/Modules/Shared/Views/Partial/EditorTemplates/Single.cshtml.pp)
 - [String](../content/Modules/Shared/Views/Partial/EditorTemplates/String.cshtml.pp)
 - [Text](../content/Modules/Shared/Views/Partial/EditorTemplates/Text.cshtml.pp)
 - [TimeSpan](../content/Modules/Shared/Views/Partial/EditorTemplates/TimeSpan.cshtml.pp)

Basic usage: `@Html.EditorFor(m => item.Property)`

> Note: to use special types such as Currency, just supply the `[DataType(DataType.Currency)]` annotation
 on your model property.

## Partials
| Type               | Inherits from | Available attributes      | Comments                                                                                                  |
|--------------------|---------------|---------------------------|-----------------------------------------------------------------------------------------------------------|
| Boolean            |               | `readonly`, `disabled`    |                                                                                                           |
| Currency           | TextBoxBase   | *                         | Recommended jQuery plugin: [autoNumeric](https://github.com/BobKnothe/autoNumeric)                        |
| Date               | TextBoxBase   | *                         | Recommended jQuery plugin: [bootstrap-datepicker](https://bootstrap-datepicker.readthedocs.io/en/latest/) |
| DateTime           | TextBoxBase   | *                         | Recommended jQuery plugin: [bootstrap-datepicker](https://bootstrap-datepicker.readthedocs.io/en/latest/) |
| Decimal            | TextBoxBase   | *                         |                                                                                                           |
| DropDown           |               | `required`                | See detailed information below                                                                            |
| EmailAddress       | TextBoxBase   | *                         | Uses HTML5 email type                                                                                     |
| Enum               |               |                           | * untested *                                                                                              |
| HttpPostedFileBase |               | `noLabel`                 | You may want to translate partial's text                                                                  |
| Int32              | TextBoxBase   | *                         |                                                                                                           |
| MultilineText      |               | `placeholder`, `readonly` |                                                                                                           |
| Password           |               |                           |                                                                                                           |
| Single             | TextBoxBase   | *                         |                                                                                                           |
| String             | TextBoxBase   | *                         |                                                                                                           |
| Text               | TextBoxBase   | *                         |                                                                                                           |
| TimeSpan           | TextBoxBase   | *                         |                                                                                                           |

### DropDown
Usage: TODO

### Customization
All components that inherits from TextBoxBase can be customized using the following attributes:

Usage:

```c#
@Html.EditorFor(m => item.Property, new {
    placeholder: "My property"
})
```

| Key         | Values              | Comment                       |
|-------------|---------------------|-------------------------------|
| class       |                     |                               |
| type        |                     | Input's HTML `type` attribute |
| placeholder |                     |                               |
| readonly    |                     |                               |
| value       | Defaults to model's |                               |
| noLabel     |                     |                               |
