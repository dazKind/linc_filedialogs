import filedialogs.FileDialogs;
class Main {
	static function main() {
		var res = FileDialogs.open_file("Open files", "", ["Cortex Resource Files", "*.cxr"], Option.Multiselect);
		trace(res);

		var res = FileDialogs.save_file("Save a file", ".cxr", ["Cortex Resource Files", "*.cxr"]);
		trace(res);

		var res = FileDialogs.select_folder("Select a folder");
		trace(res);

		var btn:Button = FileDialogs.message(
			"Unsaved Files",
			"Do you want to save the current document\n before closing the application?",
			Choice.Yes_No_Cancel, Icon.Warning);

		FileDialogs.notify(
			"Cortex event", 
			"Something might be on fire 🔥", 
			Icon.Warning
		);
	}
}