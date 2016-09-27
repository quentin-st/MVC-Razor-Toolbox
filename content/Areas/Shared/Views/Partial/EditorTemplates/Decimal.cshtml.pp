@using System.Globalization
@model decimal?

@{
    ViewBag.htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();
    ViewBag.htmlAttributes["data-autonumeric"] = "true";

    // AutoNumeric needs dd.dd instead of dd,dd
    var numberFormatInfo = new NumberFormatInfo { NumberDecimalSeparator = "." };
    ViewBag.value = Model.HasValue ? String.Format(numberFormatInfo, "{0:0.00}", Model.Value) : "";
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
