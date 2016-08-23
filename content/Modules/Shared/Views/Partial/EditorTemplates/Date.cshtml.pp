@using $rootnamespace$.Helpers.Razor
@model DateTime?

@{
    DateTime dt;
    if (Model.HasValue)
    {
        dt = (DateTime)Model;
    }
    else
    {
        dt = DateTime.Now;
    }

    var format = System.Threading.Thread.CurrentThread.CurrentUICulture.DateTimeFormat.ShortDatePattern;
    
    ViewBag.htmlAttributes = new RouteValueDictionary
    {
        {"class", "datepicker"},
        {"Value", dt.ToString(format)},
        {"data_provide", "datepicker"},
        {"data_date", dt.ToShortDateString()},
        {"data_date_format", format.Replace("M", "m")},
        {"placeholder", ViewBag.placeholder},
        {"data-date-min", ViewBag.min_date != null ? HtmlHelpers.ToJavascriptDate(ViewBag.min_date) : null},
        {"data-date-max", ViewBag.max_date != null ? HtmlHelpers.ToJavascriptDate(ViewBag.max_date) : null}
    };
}

@Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
