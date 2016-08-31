@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    var htmlAttributes = new RouteValueDictionary
    {
        {"class", HtmlClasses.Input + " input-block-level "}
    };
    if (ViewBag.placeholder != null)
    {
        htmlAttributes.Add("placeholder", ViewBag.placeholder);
    }
    if (ViewBag.@readonly != null)
    {
        htmlAttributes.Add("readonly", ViewBag.@readonly);
    }
}

<div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))@(ViewData.ModelMetadata.IsRequired?" required":"")">
    @Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/_Label.cshtml")

    <div class="controls @HtmlClasses.Control">
        @Html.TextAreaFor(
            m => m,
            5, 8,
            htmlAttributes
        )
        @Html.ValidationMessageFor(m => m, null, new { @class = "help-block" })
    </div>
</div>
