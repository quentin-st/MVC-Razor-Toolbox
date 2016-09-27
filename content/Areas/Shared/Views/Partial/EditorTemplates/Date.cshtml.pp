@using $rootnamespace$.Helpers.Razor
@model DateTime?

@{
    var format = System.Threading.Thread.CurrentThread.CurrentUICulture.DateTimeFormat.ShortDatePattern;
    DateTime? date = Model;
    
    if (date.HasValue)
    {
        if (ViewBag.min_date != null && date < (DateTime) ViewBag.min_date)
        {
            date = (DateTime) ViewBag.min_date;
        }
        
        if (ViewBag.max_date != null && date > (DateTime) ViewBag.max_date)
        {
            date = (DateTime) ViewBag.max_date;
        }
    }

    var strDate = date.HasValue ? date.Value.ToString(format) : null;

    ViewBag.htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();
    ViewBag.htmlAttributes["class"] = "datepicker";
    ViewBag.htmlAttributes["Value"] = strDate;
    ViewBag.htmlAttributes["data_provide"] = "datepicker";
    ViewBag.htmlAttributes["data_date"] = strDate;
    ViewBag.htmlAttributes["data_date_format"] = format.Replace("M", "m");
    ViewBag.htmlAttributes["placeholder"] = ViewBag.placeholder;
    ViewBag.htmlAttributes["data-date-min"] = ViewBag.min_date != null ? HtmlHelpers.ToJavascriptDate(ViewBag.min_date) : null;
    ViewBag.htmlAttributes["data-date-max"] = ViewBag.max_date != null ? HtmlHelpers.ToJavascriptDate(ViewBag.max_date) : null;
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
