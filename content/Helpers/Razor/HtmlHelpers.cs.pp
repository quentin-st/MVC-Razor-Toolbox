using System;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace $rootnamespace$.Helpers.Razor
{
    public static class HtmlHelpers
    {
        public static MvcHtmlString Concat(params MvcHtmlString[] items)
        {
            var builder = new StringBuilder();
            foreach (var item in items.Where(i => i != null))
                builder.Append(item.ToHtmlString());
            return MvcHtmlString.Create(builder.ToString());
        }

        public static int GetMaxLength(ViewDataDictionary<object> ViewData)
        {
            var additionalValues = ViewData.ModelMetadata.AdditionalValues;

            return additionalValues.ContainsKey("StringLength")
                ? (int)additionalValues["StringLength"]
                : -1;
        }

        public static MvcHtmlString AnonymousObjectToHTMLString(object htmlAttributes)
        {
            var dictionary = HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes);

            return new MvcHtmlString(dictionary.Aggregate("", (current, item) => current + (item.Key + "=\"" + item.Value + "\" ")));
        }

        public static double ToJavascriptDate(DateTime? dateTime)
        {
            return dateTime.HasValue
                ? dateTime.Value.Subtract(new DateTime(1970, 1, 1)).TotalMilliseconds
                : -1;
        }
    }
}
