@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    /*
     * Note: if this field is not required, we'll prepend an empty choice in it (string.empty parameter)
     */

    var htmlAttributes = new {@class = "form-control"};
    
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
        
        @Html.ValidationMessageFor(m => m, null, new {@class = "help-block"})
    </div>
</div>
