@model string

@{
    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {"type", "email"}
    };
}

@Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
