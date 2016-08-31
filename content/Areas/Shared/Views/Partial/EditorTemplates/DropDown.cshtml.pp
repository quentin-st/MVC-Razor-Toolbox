@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    /*
     * Note: if this field is not required, we'll prepend an empty choice in it (string.empty parameter)
     */

    var htmlAttributes = (RouteValueDictionary)ViewBag.htmlAttributes ?? new RouteValueDictionary();

    // Styling
    htmlAttributes["class"] = HtmlClasses.Input + " " + (htmlAttributes["class"] ?? "");
    
    var required = ViewData.ModelMetadata.IsRequired;
    // Override attribute overriden by "required" = true or "required = "required" attribute on field
    if (ViewData.ContainsKey("required"))
    {
        var requiredAttr = ViewData["required"];
        if (requiredAttr is bool)
        {
            required = (bool) requiredAttr;
        }
        else if (requiredAttr is string)
        {
            required = (string) requiredAttr == "required";
        }
    }

    // When using the readonly attribute, the <select> will still be usable
    // (read http://stackoverflow.com/questions/1636103/html-dropdownlist-disabled-readonly)
    // We'll switch it to disabled, and add a hidden field so the value will still be sent to the controller on post
    if (ViewBag.@readonly != null || ViewBag.disabled != null)
    {
        htmlAttributes["disabled"] = "disabled";
    }
}

<div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))@(ViewData.ModelMetadata.IsRequired?" required":"")">
    @Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/_Label.cshtml")

    <div class="controls @HtmlClasses.Control">
        @if (required)
        {
            @Html.DropDownListFor(m => m, (SelectList)ViewData["selectList"], htmlAttributes)
        }
        else
        {
            @Html.DropDownListFor(m => m, (SelectList)ViewData["selectList"], string.Empty, htmlAttributes)
        }

        @if (htmlAttributes.ContainsKey("disabled"))
        {
            @Html.HiddenFor(m => m)
        }

        @Html.ValidationMessageFor(m => m, null, new {@class = "help-block"})
    </div>
</div>
