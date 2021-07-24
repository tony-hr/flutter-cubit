import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as GTrans;
import 'package:test_tony/cubit/news_cubit.dart';
import 'package:test_tony/components/awesomeList.dart';
import 'package:test_tony/components/infoLoadContent.dart';
import 'package:test_tony/screen/news/detail.dart';
import 'package:test_tony/theme/style.dart' as Theme;
import 'package:test_tony/utils/convertFormat.dart';

class NewsScreen extends StatefulWidget {
  final int? selectedOrderStatus;
  const NewsScreen({ Key? key, this.selectedOrderStatus }) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final newsCubit = NewsCubit();
  List tempStatusOrder = [];
  List dataTab = [
    {"id": "id",  "name": "Indonesia" },
    {"id": "us", "name": "Amerika"},
    {"id": "au", "name": "Australia"},
    {"id": "fr", "name": "Francis"},
    {"id": "tr", "name": "Turki"},
    {"id": "in", "name": "India"}
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: dataTab.length, vsync: this);
    newsCubit.getNewsList(dataTab[0]["id"]);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tab(dataTab)
    );
  }

  Widget tab(_tabs){
    final List<String> _textTabs = [];

    _tabs.map((e){
      _textTabs.add(e["name"]);
    }).toList();

    return DefaultTabController(
      length: dataTab.length,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Berita Terbaru", style: TextStyle(
              fontSize: 23.0
            )),
            pinned: true,
            snap: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.Colors.body,
                  border: Border(
                    bottom: BorderSide(color: Theme.Colors.border)
                  )
                ),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  automaticIndicatorColorAdjustment: true,
                  overlayColor: MaterialStateProperty.all(Colors.white),
                  labelColor: Theme.Colors.primary,
                  labelStyle: TextStyle(fontWeight: FontWeight.w400),
                  unselectedLabelColor: Theme.Colors.font2,
                  indicatorColor: Theme.Colors.second,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 25.0),
                  tabs: _textTabs.map((String name) => Tab(text: name)).toList(),
                  onTap: (tabIndex){
                    newsCubit.getNewsList(dataTab[tabIndex]["id"]);
                  }
                ),
              ),
            ),
          ),
          
          tabContent(_textTabs)
        ],
      ),
    );
  }

  Widget tabContent(_textTabs){
    return SliverFillRemaining(
      child: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: _textTabs.map<Widget>((e){
          var indexTab = _textTabs.indexOf(e);

          return BlocBuilder<NewsCubit, NewsState>(
            bloc: newsCubit,
            builder: (context, state){
              if (state is SuccessNews) {
                return ListContent(berita: state.news);

              } else if (state is FailureNews) {
                return LoadContentNoData(
                  title: state.errorStatus,
                  description: state.errorMessage
                );

              } else if (state is ErrorNews) {
                return LoadContentError(
                  title: "Oops.. Terjadi Kesalahan",
                  description: "Gagal memuat daftar berita "+dataTab[indexTab]["name"],
                  onPressed: () => newsCubit.getNewsList(dataTab[indexTab]["id"])
                );
              }

              return Center(
                child: CircularProgressIndicator()
              );
            }
          );
        }).toList()
      ),
    );
  }
}

class ListContent extends StatefulWidget {
  const ListContent({ Key? key, required this.berita }) : super(key: key);
  final berita;

  @override
  _ListContentState createState() => _ListContentState();
}

class _ListContentState extends State<ListContent> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
      itemCount: widget.berita.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Get.to(
            DetailScreen(url: widget.berita[index].url),
            transition: GTrans.Transition.zoom,
            duration: Duration(milliseconds: 400),
            fullscreenDialog: true
          ),
          child: AwesomeListItem(
            title: widget.berita[index].title,
            description: ConvertFormat.datetime(widget.berita[index].publishedAt),
            image: widget.berita[index].urlToImage
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}