namespace $rootnamespace$.Helpers.Razor
{
    public class HtmlClasses
    {
        private const string Col_Label = "4";
        private const string Col_Control = "8";


        public const string Label = "col-sm-" + Col_Label + " control-label";

        private const string ControlBase = "col-sm-" + Col_Control;
        public const string Control = ControlBase + " control-value";
        public const string ControlOffset = Control + " col-sm-offset-" + Col_Label;
        public const string Input = "form-control";

        public const string ControlRaw = ControlBase + " control-raw";
    }
}
