@model object

@{
    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {
            "class", "form-control input-block-level" + (ViewBag.ClearTextField == true ? "clear-text-field" : "")
        }
    };
}

@Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
