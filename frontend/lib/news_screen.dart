/*import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_service.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  late Future<List<dynamic>> _newsArticles;

  @override
  void initState() {
    super.initState();
    _newsArticles = _newsService.fetchNews(country: 'us'); // Fetch news
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybersecurity News'),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _newsArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          }

          final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              final String imageUrl = article['urlToImage'] ?? ''; 
              final bool validImage = imageUrl.startsWith('http');

              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: validImage 
                      ? Image.network(
                          imageUrl,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 80),
                        )
                      : Icon(Icons.image, size: 80), // Placeholder if no image
                  title: Text(
                    article['title'] ?? 'No Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    article['description'] ?? 'No Description',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _openArticle(article['url']),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to open the news article in a web browser
  void _openArticle(String? url) async {
    if (url == null || url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid article link')),
      );
      return;
    }
    
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot open article')),
      );
    }
  }
}
*/
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_service.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsService _newsService = NewsService();
  late Future<List<dynamic>> _newsArticles;
  List<dynamic> _filteredArticles = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _newsArticles = _newsService.fetchNews(country: 'us');
    _newsArticles.then((articles) {
      setState(() {
        _filteredArticles = articles;
      });
    });
  }

  void _filterNews(String query) {
    setState(() {
      _newsArticles.then((articles) {
        _filteredArticles = articles.where((article) {
          final title = article['title']?.toLowerCase() ?? '';
          return title.contains(query.toLowerCase());
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cybersecurity News'),
        backgroundColor: const Color.fromARGB(255, 18, 17, 20),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search news...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: _filterNews,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: _newsArticles,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No news available.'));
                }

                return ListView.builder(
                  itemCount: _filteredArticles.length,
                  itemBuilder: (context, index) {
                    final article = _filteredArticles[index];
                    final String imageUrl = article['urlToImage'] ?? ''; 
                    final bool validImage = imageUrl.startsWith('http');

                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: validImage 
                            ? Image.network(
                                imageUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image, size: 80),
                              )
                            : Icon(Icons.image, size: 80),
                        title: Text(
                          article['title'] ?? 'No Title',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          article['description'] ?? 'No Description',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () => _openArticle(article['url']),
                        trailing: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _openArticle(String? url) async {
    if (url == null || url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid article link')),
      );
      return;
    }
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot open article')),
      );
    }
  }
}
