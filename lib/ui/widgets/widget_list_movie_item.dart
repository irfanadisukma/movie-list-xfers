// Made for Xfers Job Requirements 
// by Irfan Adisukma - madisukma@gmail.com | +6282211144633

part of 'widgets.dart';

class WidgetListMovieItem extends StatelessWidget {
  const WidgetListMovieItem({
    required this.data,
  });

  final Result data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 5,
                offset: Offset(1, 2))
          ]),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(data: data)));
        },
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
          width: MediaQuery.of(context).size.width,
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(
              (data.posterPath == null)
                  ? img_placeholder
                  : base_url_image + img_size_w92 + data.posterPath!,
              width: 92,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    SizedBox(height: marginXsmall),
                    Text(
                      (data.overview == null || data.overview!.isEmpty)
                          ? "Overview not available"
                          : data.overview!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                    SizedBox(height: marginXsmall),
                    Text(
                      (data.releaseDate == null || data.releaseDate!.isEmpty)
                          ? "Release date not available"
                          : data.releaseDate!,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                          fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
