@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions
@model object


<div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))@(ViewData.ModelMetadata.IsRequired?" required":"")">
    @Html.Partial("~/Modules/Shared/Views/Partial/EditorTemplates/_Label.cshtml")

    <div class="controls @HtmlClasses.Control">
        @Html.EnumDropDownListFor(m => m, new {@class = "form-control"})
        @Html.ValidationMessageFor(m => m, null, new {@class = "help-block"})
    </div>
</div>
