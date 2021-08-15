// Made for Xfers Job Requirements 
// by Irfan Adisukma - madisukma@gmail.com | +6282211144633

part of 'screens.dart';

class MovieListScreen extends StatefulWidget {
  MovieListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<Result> movieListItems = [];
  int currentPage = 1;
  int totalPage = 1;
  bool isLoading = false;
  bool isInitialLoading = true;

  void getMovieList(int page) async {
    ServiceMovieList().getListMovies(page.toString()).then((value) {
      setState(() {
        currentPage = page;
        totalPage = value!.totalPages!;
        movieListItems.addAll(value.results!);
        isLoading = false;
        isInitialLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    getMovieList(currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: "List Movie",
            ),
            Tab(
              text: "Grid Movie",
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Stack(children: [
        TabBarView(
          controller: tabController,
          children: <Widget>[_listMovieTab(), _gridMovieTab()],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: isLoading ? 50.0 : 0,
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ])),
    );
  }

  Widget _listMovieTab() {
    return (!isInitialLoading)
        ? Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  setState(() {
                    if (currentPage != totalPage) {
                      getMovieList(currentPage += 1);
                      isLoading = true;
                    }
                  });
                }
                return true;
              },
              child: ListView.builder(
                itemCount: movieListItems.length,
                itemBuilder: (context, index) {
                  return WidgetListMovieItem(data: movieListItems[index]);
                },
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget _gridMovieTab() {
    return (!isInitialLoading)
        ? Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  setState(() {
                    if (currentPage != totalPage) {
                      getMovieList(currentPage += 1);
                      isLoading = true;
                    }
                  });
                }
                return true;
              },
              child: GridView.builder(
                itemCount: movieListItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.35),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return WidgetGridMovieItem(data: movieListItems[index]);
                },
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
  }
}
