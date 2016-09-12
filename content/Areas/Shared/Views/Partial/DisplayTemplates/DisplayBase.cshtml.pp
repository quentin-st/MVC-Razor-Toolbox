@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object

@{
    // Kind: either "raw" or "form-group"
    ViewBag.kind = ViewBag.kind ?? "raw";

    if (ViewBag.kind != "raw" && ViewBag.kind != "form-group")
    {
        throw new Exception("Unknown kind " + ViewBag.kind);
    }
    
    // Value
    var value = ViewBag.value ?? Model;
    
    // HTML attributes
    var htmlAttributes = (RouteValueDictionary)ViewBag.htmlAttributes ?? new RouteValueDictionary();

    // Debugging tip
    if (HttpContext.Current.IsDebuggingEnabled)
    {
        htmlAttributes["data-displaytemplate-type"] = ViewData.ModelMetadata.ModelType.Name;
    }

    htmlAttributes["class"] =
        (ViewBag.kind == "form-group" ? "controls " + HtmlClasses.ControlRaw + " " : "") + // Class depending on kind
        ViewBag.valueClass + " " + // text-date, text-number...
        ViewBag.@class; // Custom classes
    
}

@if (ViewBag.kind == "raw")
{
    <div @HtmlHelpers.DictionaryToHTMLString(htmlAttributes)>
        @value

        @if (ViewBag.suffix != null)
        {
            @ViewBag.suffix
        }
    </div>
}
else if (ViewBag.kind == "form-group")
{
    <div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))">
        @Html.LabelFor(m => m, new { @class = HtmlClasses.Label })

        <div @HtmlHelpers.DictionaryToHTMLString(htmlAttributes)>
            @value

            @if (ViewBag.suffix != null)
            {
                @ViewBag.suffix
            }
        </div>
    </div>
}
