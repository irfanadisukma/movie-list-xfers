// Made for Xfers Job Requirements 
// by Irfan Adisukma - madisukma@gmail.com | +6282211144633

part of 'widgets.dart';

class WidgetGridMovieItem extends StatelessWidget {
  const WidgetGridMovieItem({
    required this.data,
  });

  final Result data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
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
                        builder: (context) =>
                            MovieDetailScreen(data: data)));

        },
        child: Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width / 2,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.network(
              (data.posterPath == null)
                  ? img_placeholder
                  : base_url_image + img_size_w92 + data.posterPath!,
              width: 92,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.title!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                
                  Text(
                    (data.overview == null || data.overview!.isEmpty)
                        ? "Overview not available"
                        : data.overview!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text(
                    (data.releaseDate == null || data.releaseDate!.isEmpty)
                        ? "Release date not available"
                        : data.releaseDate!,
                         textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                        fontSize: 10),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
