// Made for Xfers Job Requirements 
// by Irfan Adisukma - madisukma@gmail.com | +6282211144633

part of 'screens.dart';

class MovieDetailScreen extends StatefulWidget {
  MovieDetailScreen({Key? key, required this.data}) : super(key: key);

  final Result data;

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.title!),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: marginDefault, vertical: marginMedium),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Image.network(
                      (widget.data.posterPath == null)
                          ? img_placeholder
                          : base_url_image +
                              img_size_w500 +
                              widget.data.posterPath!,
                      width: 185,
                    ),
                  ),
                ),
                SizedBox(height: marginSmall),
                Text(
                 widget.data.title!,
                 textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 24),
                ),
                 SizedBox(height: marginSmall),
                 Text(
                   (widget.data.releaseDate!.isEmpty) ? "Release date not available" : "Release Date : " +widget.data.releaseDate!,
                   textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 12),
                ),
                 SizedBox(height: marginSmall),
                  Divider(),
                SizedBox(height: marginSmall),
              
                Text(
                   (widget.data.overview!.isEmpty) ? "Overview not available" :widget.data.overview!,
                    textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14),
                ),
              ]),
        )),
      ),
    );
  }
}
