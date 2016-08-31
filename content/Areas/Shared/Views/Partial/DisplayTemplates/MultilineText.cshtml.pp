@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    ViewBag.value = Model != null ? Html.Nl2br(Model.ToString()) : null;
}

@Html.Partial("~/Areas/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml")
