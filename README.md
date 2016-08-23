# MVC-Razor-Toolbox
Bootstrap DisplayTemplates, EditorTemplates &amp; util classes for Razor templating engine

## Components
This toolbox provides the following helpers and components:

### DisplayTemplates
DisplayTemplates are supplied for the following types:

 - [Boolean](content/Modules/Shared/Views/Partial/DisplayTemplates/Boolean.cshtml.pp)
 - [Currency](content/Modules/Shared/Views/Partial/DisplayTemplates/Currency.cshtml.pp)
 - [Date](content/Modules/Shared/Views/Partial/DisplayTemplates/Date.cshtml.pp)
 - [DateTime](content/Modules/Shared/Views/Partial/DisplayTemplates/DateTime.cshtml.pp)
 - [Decimal](content/Modules/Shared/Views/Partial/DisplayTemplates/Decimal.cshtml.pp)
 - [EmailAddress](content/Modules/Shared/Views/Partial/DisplayTemplates/EmailAddress.cshtml.pp)
 - [MultilineText](content/Modules/Shared/Views/Partial/DisplayTemplates/MultilineText.cshtml.pp)
 - [Number](content/Modules/Shared/Views/Partial/DisplayTemplates/Number.cshtml.pp)
 - [String](content/Modules/Shared/Views/Partial/DisplayTemplates/String.cshtml.pp)

Basic usage: `@Html.DisplayFor(m => item.Property)`

> Note: to use special types such as Currency, just supply the `[DataType(DataType.Currency)]` annotation
 on your model property.

### EditorTemplates
EditorTemplates are supplied for the following types:

 - [Boolean](content/Modules/Shared/Views/Partial/EditorTemplates/Boolean.cshtml.pp)
 - [Currency](content/Modules/Shared/Views/Partial/EditorTemplates/Currency.cshtml.pp)
 - [Date](content/Modules/Shared/Views/Partial/EditorTemplates/Date.cshtml.pp)
 - [DateTime](content/Modules/Shared/Views/Partial/EditorTemplates/DateTime.cshtml.pp)
 - [Decimal](content/Modules/Shared/Views/Partial/EditorTemplates/Decimal.cshtml.pp)
 - [DropDown](content/Modules/Shared/Views/Partial/EditorTemplates/DropDown.cshtml.pp)
 - [EmailAddress](content/Modules/Shared/Views/Partial/EditorTemplates/EmailAddress.cshtml.pp)
 - [Enum](content/Modules/Shared/Views/Partial/EditorTemplates/Enum.cshtml.pp)
 - [HttpPostedFileBase](content/Modules/Shared/Views/Partial/EditorTemplates/HttpPostedFileBase.cshtml.pp)
 - [Int32](content/Modules/Shared/Views/Partial/EditorTemplates/Int32.cshtml.pp)
 - [MultilineText](content/Modules/Shared/Views/Partial/EditorTemplates/MultilineText.cshtml.pp)
 - [Password](content/Modules/Shared/Views/Partial/EditorTemplates/Password.cshtml.pp)
 - [Single](content/Modules/Shared/Views/Partial/EditorTemplates/Single.cshtml.pp)
 - [String](content/Modules/Shared/Views/Partial/EditorTemplates/String.cshtml.pp)
 - [Text](content/Modules/Shared/Views/Partial/EditorTemplates/Text.cshtml.pp)
 - [TimeSpan](content/Modules/Shared/Views/Partial/EditorTemplates/TimeSpan.cshtml.pp)

Basic usage: `@Html.EditorFor(m => item.Property)`

> Note: to use special types such as Currency, just supply the `[DataType(DataType.Currency)]` annotation
 on your model property.

### FlashMessage
Displays confirmation/warning/error/debug messages the next time a view is rendered:

 - Directly from the same controller action
 - After a redirect

It internally makes use of the `TempData` special object.

Include [`_FlashMessages.cshtml`](content/Modules/Shared/Views/Partial/_FlashMessages.cshtml.pp) in your view,
and use `FlashMessage.Flash(TempData, new FlashMessage(message, type, title))` in your controller:
the message will be shown in the view the next time it is rendered.

Constructor:

```c#
FlashMessage(string message, FlashMessageType type = FlashMessageType.Success, string title = null, bool debug = false)
```

> Note: setting `debug` to `true` will hide the message if `HttpContext.Current.IsDebuggingEnabled` is `false`
 (on a production environment for example).
