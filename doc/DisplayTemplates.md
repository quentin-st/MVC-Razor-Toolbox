# DisplayTemplates
DisplayTemplates are supplied for the following types:

 - [Boolean](../content/Modules/Shared/Views/Partial/DisplayTemplates/Boolean.cshtml.pp)
 - [Currency](../content/Modules/Shared/Views/Partial/DisplayTemplates/Currency.cshtml.pp)
 - [Date](../content/Modules/Shared/Views/Partial/DisplayTemplates/Date.cshtml.pp)
 - [DateTime](../content/Modules/Shared/Views/Partial/DisplayTemplates/DateTime.cshtml.pp)
 - [Decimal](../content/Modules/Shared/Views/Partial/DisplayTemplates/Decimal.cshtml.pp)
 - [EmailAddress](../content/Modules/Shared/Views/Partial/DisplayTemplates/EmailAddress.cshtml.pp)
 - [Int32](../content/Modules/Shared/Views/Partial/DisplayTemplates/Int32.cshtml.pp)
 - [MultilineText](../content/Modules/Shared/Views/Partial/DisplayTemplates/MultilineText.cshtml.pp)
 - [Number](../content/Modules/Shared/Views/Partial/DisplayTemplates/Number.cshtml.pp)
 - [String](../content/Modules/Shared/Views/Partial/DisplayTemplates/String.cshtml.pp)

Basic usage: `@Html.DisplayFor(m => item.Property)`

> Note: to use special types such as Currency, just supply the `[DataType(DataType.Currency)]` annotation
 on your model property.

## Partials
Every partial inherits from [`DisplayBase.cshtml](../content/Modules/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml.pp).

| Type          | Format (`.ToString()` if not specified)      | Styling        | Comments                             |
|---------------|----------------------------------------------|----------------|--------------------------------------|
| Boolean       | ? "Oui" : "Non"                              |                | You may want to update produced text |
| Currency      | `TemplatesConsts.CurrencyFormat` (`"{0:C}"`) | `.text-number` |                                      |
| Date          | `ToShortDateString()`                        | `.text-date`   |                                      |
| DateTime      |                                              |                | Based on Date                        |
| Decimal       |                                              | `.text-number` |                                      |
| EmailAddress  |                                              |                |                                      |
| Int32         |                                              | `.text-number` |                                      |
| MultilineText | `Html.Nl2br()`                               |                |                                      |
| Number        |                                              | `.text-number` |                                      |
| String        |                                              |                |                                      |

## Customization
Usage:

```c#
@Html.DisplayFor(m => item.Property, new {
    kind: "raw",
    suffix: "Value: "
})
```

| Key    | Values                           | Comment                                        |
|--------|----------------------------------|------------------------------------------------|
| kind   | `raw` *(default)* | `form-group` | If `form-group`, adds a label and a form-group |
| suffix | null *(default)*                 |                                                |
