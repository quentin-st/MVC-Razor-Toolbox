using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace $rootnamespace$.Helpers
{
    public class FlashMessage
    {
        private const string TempDataKey = "FlashMessages";

        public string Title { get; set; }
        public string Message { get; set; }
        public FlashMessageType Type { get; set; }
        public bool IsDebug { get; set; }

        public FlashMessage(string message, FlashMessageType type = FlashMessageType.Success, string title = null, bool debug = false)
        {
            Message = message;
            Title = title;
            Type = type;
            IsDebug = debug;
        }

        public string GetCSSClass()
        {
            return Type.ToString().ToLowerInvariant() + (IsDebug ? " debug" : "");
        }

        public static void Flash(TempDataDictionary tempData, FlashMessage flashMessage)
        {
            if (!tempData.ContainsKey(TempDataKey))
                tempData[TempDataKey] = new List<FlashMessage>();

            ((List<FlashMessage>) tempData[TempDataKey]).Add(flashMessage);
        }

        private static bool HasMessages(TempDataDictionary tempData)
        {
            return tempData.ContainsKey(TempDataKey) && ((List<FlashMessage>) tempData[TempDataKey]).Count > 0;
        }

        public static List<FlashMessage> GetMessages(TempDataDictionary tempData)
        {
            var list = HasMessages(tempData)
                ? (List<FlashMessage>)tempData[TempDataKey]
                : new List<FlashMessage>();

            return HttpContext.Current.IsDebuggingEnabled
                ? list
                : list.Where(m => !m.IsDebug).ToList(); // Exclude debug messages
        }
    }

    public enum FlashMessageType
    {
        Success,
        Info,
        Error,
        Warning
    }
}
