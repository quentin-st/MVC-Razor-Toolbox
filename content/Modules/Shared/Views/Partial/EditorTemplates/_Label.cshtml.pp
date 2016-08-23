@using $rootnamespace$.Helpers.Razor
@{
    var showLabel = ViewBag.noLabel == null;
}

@if (showLabel)
{
    // ViewBag.labelText defaults model's DisplayName attribute if not defined
    @Html.LabelFor(m => m, (string) ViewBag.labelText, new { @class = HtmlClasses.Label })
}
