using System;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace $rootnamespace$.Helpers.Razor.HtmlExtensions
{
    public static class ReadOnlyForExtension
    {
        public static MvcHtmlString ReadOnlyFor<TModel, TValue>(this HtmlHelper<TModel> html,
            Expression<Func<TModel, TValue>> expression)
        {
            return html.EditorFor(expression, new
            {
                @readonly = "readonly"
            });
        }
    }
}
