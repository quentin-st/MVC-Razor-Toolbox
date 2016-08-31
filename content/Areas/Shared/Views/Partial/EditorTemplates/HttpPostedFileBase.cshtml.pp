@using $rootnamespace$.Helpers.Razor
@using $rootnamespace$.Helpers.Razor.HtmlExtensions

@{
    var showLabel = ViewBag.noLabel == null;
    var controlsClasses = showLabel ? HtmlClasses.Label : "control-label";
}

<div class="form-group@(Html.ValidationErrorFor(m => m, " has-error"))@(ViewData.ModelMetadata.IsRequired ? " required" : "")">
    @Html.Partial("~/Areas/Shared/Views/Partial/EditorTemplates/_Label.cshtml")

    <div class="@controlsClasses">
        <div class="input-group input-file">
            <div class="input-group-btn">
                <span class="btn btn-default btn-file">
                    Parcourir&hellip; <input type="File" name="@Html.IdFor(m => m)" id="@Html.IdFor(m => m)" class="btn-default btn-file" />
                </span>
            </div>
            <input type="text" class="form-control" readonly/>
        </div>

        @Html.ValidationMessageFor(m => m, null, new {@class = "help-block"})
    </div>
</div>
