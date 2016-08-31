using System;
using System.Text.RegularExpressions;
using System.Web.Mvc;

namespace $rootnamespace$.Helpers.Razor.HtmlExtensions
{
    public static class Nl2brExtension
    {
        /* Nl2br */
        public static MvcHtmlString Nl2br(this HtmlHelper helper, string text)
        {
            if (string.IsNullOrEmpty(text))
                return new MvcHtmlString(text);

            // Replace \r\n with \n, then \n with <br/>
            var html = helper.Encode(text);
            html = Regex.Replace(html, Environment.NewLine, "\n");
            html = Regex.Replace(html, "\n", "<br/>");

            return new MvcHtmlString(html);
        }
    }
}
