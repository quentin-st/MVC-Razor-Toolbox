@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    // HTML attributes
    var htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();


    htmlAttributes["class"] = HtmlClasses.Input + " " + (htmlAttributes["class"] ?? "");

    if (ViewBag.type != null)
    {
        htmlAttributes["type"] = ViewBag.type;
    }
    if (ViewBag.placeholder != null)
    {
        htmlAttributes["placeholder"] = ViewBag.placeholder;
    }
    if (ViewBag.@readonly != null)
    {
        htmlAttributes["readonly"] = ViewBag.@readonly;
    }
    var maxLength = HtmlHelpers.GetMaxLength(ViewData);
    if (maxLength != -1)
    {
        htmlAttributes["maxlength"] = maxLength;
    }

    // Value
    var value = ViewData.TemplateInfo.FormattedModelValue;
    if (ViewBag.value != null)
    {
        value = ViewBag.value;
    }

    var showLabel = ViewBag.noLabel == null;
    var controlsClasses = showLabel ? HtmlClasses.Label : "control-label";
    var debugAttribute = HttpContext.Current.IsDebuggingEnabled ? ViewData.ModelMetadata.ModelType.Name : null;
}


<div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))@(ViewData.ModelMetadata.IsRequired ? " required" : "")"
     @if (debugAttribute != null) { <text> data-editortemplate-type="@debugAttribute" </text>  }>
    @Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/_Label.cshtml")

    <div class="controls @controlsClasses">
        @Html.TextBox(
            "",
            value,
            htmlAttributes)

        @Html.ValidationMessageFor(m => m, null, new { @class = "help-block" })
    </div>
</div>
