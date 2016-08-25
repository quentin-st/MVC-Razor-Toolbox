@model float?

@{
    ViewBag.value = Model ?? 0.0f;

    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {
            "class", "form-control input-block-level"
        }
    };
}

@Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
