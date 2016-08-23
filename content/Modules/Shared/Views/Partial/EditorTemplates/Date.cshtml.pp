@using $rootnamespace$.Helpers.Razor
@model DateTime?

@{
    var format = System.Threading.Thread.CurrentThread.CurrentUICulture.DateTimeFormat.ShortDatePattern;
    var date = Model.HasValue ? ((DateTime) Model).ToString(format) : null;
    
    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {"class", "datepicker"},
        {"Value", date},
        {"data_provide", "datepicker"},
        {"data_date", date},
        {"data_date_format", format.Replace("M", "m")},
        {"placeholder", ViewBag.placeholder},
        {"data-date-min", ViewBag.min_date != null ? HtmlHelpers.ToJavascriptDate(ViewBag.min_date) : null},
        {"data-date-max", ViewBag.max_date != null ? HtmlHelpers.ToJavascriptDate(ViewBag.max_date) : null}
    };
}

@Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
