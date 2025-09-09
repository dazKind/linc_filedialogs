package filedialogs;

import haxe.io.Path;

//
@:notNull
@:unreflective
extern enum abstract Native_Button(Native_ButtonImpl) {
    @:native("pfd::button::cancel") var Cancel;
    @:native("pfd::button::ok") var Ok;
    @:native("pfd::button::yes") var Yes;
    @:native("pfd::button::no") var No;
    @:native("pfd::button::abort") var Abort;
    @:native("pfd::button::retry") var Retry;
    @:native("pfd::button::ignore") var Ignore;
}
@:unreflective
@:native('pfd::button')
@:lincCppiaDef('Button', 'enum')
extern class Native_ButtonImpl { }
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapEnumExtern('Native_Button'))
    enum abstract Button(Int) from Int to Int {}
#else
    typedef Button = Native_Button;
#end


//
@:notNull
@:unreflective
extern enum abstract Native_Choice(Native_ChoiceImpl) {
    @:native("pfd::choice::ok") var Ok;
    @:native("pfd::choice::ok_cancel") var Ok_Cancel;
    @:native("pfd::choice::yes_no") var Yes_No;
    @:native("pfd::choice::yes_no_cancel") var Yes_No_Cancel;
    @:native("pfd::choice::retry_cancel") var Retry_Cancel;
    @:native("pfd::choice::abort_retry_ignore") var Abort_Retry_Ignore;
}
@:unreflective
@:native('pfd::choice')
@:lincCppiaDef('Choice', 'enum')
extern class Native_ChoiceImpl { }
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapEnumExtern('Native_Choice'))
    enum abstract Choice(Int) from Int to Int {}
#else
    typedef Choice = Native_Choice;
#end


//
@:notNull
@:unreflective
extern enum abstract Native_Icon(Native_IconImpl) {
    @:native("pfd::icon::info") var Info;
    @:native("pfd::icon::warning") var Warning;
    @:native("pfd::icon::error") var Error;
    @:native("pfd::icon::question") var Question;
}
@:unreflective
@:include('linc_filedialogs.h')
@:native('pfd::icon')
@:lincCppiaDef('Icon', 'enum')
extern class Native_IconImpl { }
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapEnumExtern('Native_Icon'))
    enum abstract Icon(Int) from Int to Int {}
#else
    typedef Icon = Native_Icon;
#end


//
@:notNull
@:unreflective
extern enum abstract Native_Option(Native_OptionImpl) {
    @:native("pfd::opt::none") var None;
    @:native("pfd::opt::multiselect") var Multiselect;
    @:native("pfd::opt::force_overwrite") var Force_Overwrite;
    @:native("pfd::opt::force_path") var Force_Path;
}
@:unreflective
@:native('pfd::opt')
@:lincCppiaDef('Option', 'enum')
extern class Native_OptionImpl { }
#if (scriptable || cppia)
    @:build(linc.LincCppia.wrapEnumExtern('Native_Option'))
    enum abstract Option(Int) from Int to Int {}
#else
    typedef Option = Native_Option;
#end


//
@:keep
@:include('linc_filedialogs.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('filedialogs'))
#end
extern class Native_FileDialogs {
    inline public static function open_file(_title:String, ?_intial_path:String=null, ?_filters:Array<String>=null, _options:Native_Option=Native_Option.None):Array<String>
        return untyped __cpp__('linc::filedialogs::open_file({0}, {1}, {2}, {3})', _title, _intial_path, _filters, _options);

    inline public static function save_file(_title:String, ?_intial_path:String=null, ?_filters:Array<String>=null, _options:Native_Option=Native_Option.None):String
        return untyped __cpp__('linc::filedialogs::save_file({0}, {1}, {2}, {3})', _title, _intial_path, _filters, _options);

    inline public static function select_folder(_title:String, ?_intial_path:String=null, _options:Native_Option=Native_Option.None):String
        return untyped __cpp__('linc::filedialogs::select_folder({0}, {1}, {2})', _title, _intial_path, _options);

    @:native('linc::filedialogs::message')
    public static function message(_title:String, _text:String, _choice:Native_Choice, _icon:Native_Icon):Native_Button;

    @:native('linc::filedialogs::notify')
    public static function notify(_title:String, _message:String, _icon:Native_Icon):Void;
}
#if (scriptable || cppia)
    class FileDialogs {
        public static function open_file(_title:String, ?_intial_path:String=null, ?_filters:Array<String>=null, _options:Option=None):Array<String>
            return Native_FileDialogs.open_file(_title, _intial_path, _filters, cast (_options ?? 0x0));

        public static function save_file(_title:String, ?_intial_path:String=null, ?_filters:Array<String>=null, _options:Option=None):String
            return Native_FileDialogs.save_file(_title, _intial_path, _filters, cast (_options ?? 0x0));

        public static function select_folder(_title:String, ?_intial_path:String=null, _options:Option=None):String
            return Native_FileDialogs.select_folder(_title, _intial_path, cast (_options ?? 0x0));

        public static function message(_title:String, _text:String, _choice:Choice, _icon:Icon):Button
            return untyped __cpp__('(int){0}', Native_FileDialogs.message(_title, _text, cast _choice, cast _icon));

        public static function notify(_title:String, _message:String, _icon:Icon):Void
            return Native_FileDialogs.notify(_title, _message, cast _icon);
    }
#else
    typedef FileDialogs = Native_FileDialogs;
#end
