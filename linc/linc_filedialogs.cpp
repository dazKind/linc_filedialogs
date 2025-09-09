#include <hxcpp.h>

#include "./linc_filewatch.h"
#include <portable-file-dialogs.h>

namespace linc {
    namespace filedialogs {

        Array<String> open_file(String title, String intial_path, Array<String> _filters, pfd::opt option) {
            std::vector<std::string> filters;
            if (_filters != null()) {
                for (size_t i = 0; i < _filters->size(); ++i)
                    filters.push_back(_filters[i].c_str());
            }

            auto selection = pfd::open_file(
                title.c_str(),
                intial_path != null() ? intial_path.c_str() : "",
                filters,
                option
            ).result();

            Array<String> res = Array_obj<String>::__new(0, selection.size());
            for (std::string s : selection)
                res->push(String(s.c_str()));

            return res;
        }

        String save_file(String title, String intial_path, Array<String> _filters, pfd::opt option) {
            std::vector<std::string> filters;
            if (_filters != null()) {
                for (size_t i = 0; i < _filters->size(); ++i)
                    filters.push_back(_filters[i].c_str());
            }

            auto result = pfd::save_file(
                title.c_str(),
                intial_path != null() ? intial_path.c_str() : "",
                filters,
                option
            ).result();

            return String(result.c_str());
        }

        String select_folder(String title, String default_path, pfd::opt option) {
            auto result = pfd::select_folder(
                title.c_str(),
                default_path != null() ? default_path.c_str() : "",
                option
            ).result();

            return String(result.c_str());
        }

        pfd::button message(String title, String text, pfd::choice choice, pfd::icon icon) {
            return pfd::message(title.c_str(), text.c_str(), choice, icon).result();
        }

        void notify(String title, String message, pfd::icon icon) {
            pfd::notify(title.c_str(), message.c_str(), icon);
        }
    }
}