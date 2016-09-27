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

    ViewBag.htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();
    ViewBag.htmlAttributes["class"] = "form-control datepicker";
    ViewBag.htmlAttributes["data_provide"] = "datepicker";
    ViewBag.htmlAttributes["data_date"] = dt;
    ViewBag.htmlAttributes["data_date_format"] = format.Replace("M", "m");
    ViewBag.htmlAttributes["placeholder"] = ViewBag.placeholder;
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
