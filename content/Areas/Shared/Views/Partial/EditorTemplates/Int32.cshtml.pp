@model int?

@{
    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {"type", "number"}
    };
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
