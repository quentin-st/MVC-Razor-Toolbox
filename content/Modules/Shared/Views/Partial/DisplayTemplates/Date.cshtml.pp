@model object

@{
    if (Model is DateTime?)
    {
        var model = (DateTime?) Model;
        ViewBag.value = model.HasValue ? new MvcHtmlString("<span style=\"display: none;\">" + model.Value.ToString("yyyMMdd") + "</span>" + model.Value.ToShortDateString()) : null;
    }
    else if (Model is DateTime)
    {
        var dateTime = (DateTime) Model;
        ViewBag.value =  new MvcHtmlString("<span style=\"display: none;\">" + dateTime.ToString("yyyMMdd") + "</span>" + dateTime.ToShortDateString());
    }
    else
    {
        ViewBag.value = Model;
    }
    
    ViewBag.valueClass = "text-date";
}

@Html.Partial("~/Modules/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml")
