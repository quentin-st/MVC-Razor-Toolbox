@model object

@{
    ViewBag.value = (bool) Model ? "Oui" : "Non";
}

@Html.Partial("~/Areas/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml")
