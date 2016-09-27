@model string

@{
    ViewBag.htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();
    ViewBag.htmlAttributes["type"] = "email";
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
