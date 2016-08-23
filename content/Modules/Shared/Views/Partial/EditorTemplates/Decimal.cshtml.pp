@using $rootnamespace$.Helpers.Razor
@model decimal?

@{
    ViewBag.value = Model.HasValue ? string.Format(TemplatesConsts.DecimalFormat, Model.Value) : "";
}

@Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
