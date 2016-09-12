# MVC-Razor-Toolbox
Bootstrap DisplayTemplates, EditorTemplates &amp; util classes for Razor templating engine

## Components
This toolbox provides the following helpers and components:

### DisplayTemplates
[Read doc/DisplayTemplates.md](doc/DisplayTemplates.md)

### EditorTemplates
[Read doc/EditorTemplates.md](doc/EditorTemplates.md)

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
