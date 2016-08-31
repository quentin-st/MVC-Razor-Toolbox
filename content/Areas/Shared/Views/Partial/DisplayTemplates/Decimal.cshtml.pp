@using $rootnamespace$.Helpers.Razor
@model object

@{
    var format = ViewBag.format != null ? (string) ViewBag.format : TemplatesConsts.DecimalFormat;

    ViewBag.value = string.Format(format, Model);
    ViewBag.valueClass = "text-number";
}

@Html.Partial("~/Areas/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml")
