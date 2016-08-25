@using $rootnamespace$.Helpers
@using $rootnamespace$.Helpers.Razor.HtmlExtensions

@foreach (var message in FlashMessage.GetMessages(TempData))
{
    <div class="bs-callout bs-callout-@message.GetCSSClass()">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true" class="bs-close">&times;</span></button>

        @if (message.Title != null)
        {
            <h4>@message.Title</h4>
        }
        <p>@Html.Nl2br(message.Message)</p>
    </div>
}
