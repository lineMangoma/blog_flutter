import 'package:blog_mobile/business/models/Article.dart';
import 'package:blog_mobile/business/models/Category.dart';

class ListeArticlesState {
    List<Article>? articles;
    List<Category>? categories;
    int? page;
    String? recherche;
    int? categorieSelectionnee;
    bool? isLoading;

    ListeArticlesState({
        this.articles,
        this.categories,
        this.page,
        this.recherche,
        this.categorieSelectionnee,
        this.isLoading,
    });

    ListeArticlesState copyWith({
        List<Article>? articles,
        List<Category>? categories,
        int? page,
        String? recherche,
        int? categorieSelectionnee,
        bool? isLoading,
    }) => 
        ListeArticlesState(
            articles: articles ?? this.articles,
            categories: categories ?? this.categories,
            page: page ?? this.page,
            recherche: recherche ?? this.recherche,
            categorieSelectionnee: categorieSelectionnee ?? this.categorieSelectionnee,
            isLoading: isLoading ?? this.isLoading,
        );
}