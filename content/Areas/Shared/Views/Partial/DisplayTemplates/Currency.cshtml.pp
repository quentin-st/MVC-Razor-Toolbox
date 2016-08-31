@using $rootnamespace$.Helpers.Razor
@model object

@{
    ViewBag.value = string.Format(TemplatesConsts.CurrencyFormat, Model);
    ViewBag.valueClass = "text-number";
}

@Html.Partial("~/Areas/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml")
