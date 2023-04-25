import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/functions/search_page_funcs.dart';
import 'package:weather_app/widgets/list%20view/custom_list_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  static String id = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF342F62),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.w, bottom: 2.5.h),
                child: Text(
                  'Weather',
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
              Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF242243),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Form(
                  key: globalKey,
                  child: TextFormField(
                    focusNode: focusNode,
                    onSaved: (newValue) {
                      cityName = newValue;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Material(
                        color: Colors.transparent,
                        child: IconButton(
                            onPressed: () async {
                              globalKey.currentState!.save();
                              await SearchPageFuncs().onSearchPressed(
                                context,
                                cityName: cityName!,
                                focusNode: focusNode,
                              );
                            },
                            splashRadius: 15,
                            icon: const Icon(Icons.search_rounded)),
                      ),
                      hintText: 'Search for a city',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
               CustomListView(focusNode: focusNode),
            ],
          ),
        )),
      ),
    );
  }
}
