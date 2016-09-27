@model object

@{
    ViewBag.htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();
    ViewBag.htmlAttributes["class"] = "form-control input-block-level";
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
