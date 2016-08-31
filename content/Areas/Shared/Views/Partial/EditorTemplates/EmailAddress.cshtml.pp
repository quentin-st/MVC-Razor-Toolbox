@model string

@{
    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {"type", "email"}
    };
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
