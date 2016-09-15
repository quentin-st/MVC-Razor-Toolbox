@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    // Kind: either "raw" or "form-group"
    ViewBag.kind = ViewBag.kind ?? "form-group";

    if (ViewBag.kind != "raw" && ViewBag.kind != "form-group")
    {
        throw new Exception("Unknown kind " + ViewBag.kind);
    }
    
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

    // Model type
    htmlAttributes["data-type"] = ViewData.ModelMetadata.DataTypeName ?? ViewData.ModelMetadata.ModelType.Name;

    // Value
    var value = ViewData.TemplateInfo.FormattedModelValue;
    if (ViewBag.value != null)
    {
        value = ViewBag.value;
    }

    var showLabel = ViewBag.noLabel == null;
    var controlsClasses = showLabel ? HtmlClasses.Control : "control-label";
}

@helper Input(object value, RouteValueDictionary htmlAttributes)
{
    var input = Html.TextBox("", value, htmlAttributes);
    
    if (ViewBag.inputGroupAddon != null)
    {
        <div class="input-group">
            @input

            <span class="input-group-addon">@ViewBag.inputGroupAddon</span>
        </div>
    }
    else
    {
        @input
    }
    @Html.ValidationMessageFor(m => m, null, new { @class = "help-block" })
}

@if (ViewBag.kind == "raw")
{
    @Input(value, htmlAttributes)
}
else
{
    <div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))@(ViewData.ModelMetadata.IsRequired ? " required" : "")">
        @Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/_Label.cshtml")

        <div class="controls @controlsClasses">
            @Input(value, htmlAttributes)
        </div>
    </div>
}
