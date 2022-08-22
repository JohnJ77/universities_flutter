import 'package:tyba_test/src/pages/home_page.dart';
import 'package:tyba_test/src/pages/gridview_universities.dart';
import 'package:tyba_test/src/pages/listview_universities.dart';
import 'package:tyba_test/src/pages/university_edit.dart';
import 'package:flutter/material.dart';




Map<String, WidgetBuilder> getApplicationRoutes() {
    return <String, WidgetBuilder> {
        '/'       : (BuildContext context) => HomePage(),
        'list_view'   : (BuildContext context) => ListViewUniversities(),
        'grid_view'   : (BuildContext context) => GridViewUniversities(),    
    };
}

