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
        {"class", "form-control datepicker"},
        {"data_provide", "datepicker"},
        {"data_date", dt},
        {"data_date_format", format.Replace("M", "m")},
        {"placeholder", ViewBag.placeholder}
    };
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
