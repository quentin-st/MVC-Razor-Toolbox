@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model Boolean?

@{
    var htmlAttributes = new RouteValueDictionary {{"class", ViewBag.@class}};

    if (ViewBag.@readonly != null)
    {
        htmlAttributes["readonly"] = ViewBag.@readonly;
    }

    if (ViewBag.disabled != null)
    {
        htmlAttributes["disabled"] = ViewBag.disabled;
    }
}


<div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))">
    @Html.LabelFor(m => m, new { @class = HtmlClasses.Label })

    <div class="controls @HtmlClasses.Control">
        @Html.CheckBox(
            "",
            Model.HasValue && Model.Value,
            htmlAttributes)
        @Html.ValidationMessageFor(m => m, null, new { @class = "help-block" })
    </div>
</div>
