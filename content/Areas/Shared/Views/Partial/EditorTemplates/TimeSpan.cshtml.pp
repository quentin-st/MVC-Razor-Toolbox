@using System.Web.Mvc.Html
@model TimeSpan?

@{
    var value = Model ?? TimeSpan.FromMinutes(10);

    ViewBag.value = value;
    ViewBag.htmlAttributes = (RouteValueDictionary) ViewBag.htmlAttributes ?? new RouteValueDictionary();
    ViewBag.htmlAttributes["Value"] = value.ToString("hh\\:mm");
    ViewBag.htmlAttributes["class"] = "form-control timepicker";
    ViewBag.htmlAttributes["data_provide"] = "timepicker";
    ViewBag.htmlAttributes["data_minute_step"] = "5";
    ViewBag.htmlAttributes["data_show_meridian"] = "false";
    ViewBag.htmlAttributes["data_disable_focus"] = "true";
    ViewBag.htmlAttributes["data_template"] = "dropdown";
    ViewBag.htmlAttributes["data_default_time"] = "value";
}

@Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml")
