class BackgroundImage {
  final int id;
  final String pageURL;
  final List<String> tags;
  final String previewURL;
  final int width;
  final int height;
  final int views;
  final int downloads;
  final int likes;
  final String user;
  final String userImageURL;
  final String imageURL;

  BackgroundImage({
    required this.id,
    required this.pageURL,
    required this.tags,
    required this.previewURL,
    required this.width,
    required this.height,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.user,
    required this.userImageURL,
    required this.imageURL,
  });

  BackgroundImage.fromJSON(Map<String, dynamic> json)
      : id = json["id"] as int,
        pageURL = json["pageURL"] as String,
        tags = (json["tags"] as String).replaceAll(" ", "").split(","),
        previewURL = json["previewURL"] as String,
        width = json["imageWidth"] as int,
        height = json["imageHeight"] as int,
        views = json["views"] as int,
        downloads = json["downloads"] as int,
        likes = json["likes"] as int,
        user = json["user"] as String,
        userImageURL = json["userImageURL"] as String,
        imageURL = json["largeImageURL"];
}
