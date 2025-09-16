#pragma once
    
#ifndef HXCPP_H
#include <hxcpp.h>
#endif

// #define PFD_SKIP_IMPLEMENTATION 1
#include <portable-file-dialogs.h>

namespace linc {
    namespace filedialogs {
        Array<String> open_file(String title, String intial_path, Array<String> filters, pfd::opt);

        String save_file(String title, String intial_path, Array<String> _filters, pfd::opt option);

        String select_folder(String title, String default_path, pfd::opt option);

        pfd::button message(String title, String text, pfd::choice choice, pfd::icon icon);

        void notify(String title, String message, pfd::icon icon);
    }
}
