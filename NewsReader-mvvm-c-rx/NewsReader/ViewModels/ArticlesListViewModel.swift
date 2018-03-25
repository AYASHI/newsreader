//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Jose Jeria on 16.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import RxSwift

class ArticlesListViewModel {
    
    private let apiManager: NewsApiManager
    private let disposeBag = DisposeBag()
    let activityIndicator = ActivityIndicator()
    let articles = Variable<[Article]>([])
    
    init(with apiManager: NewsApiManager) {
        self.apiManager = apiManager
        
        mostPopularArticles()
    }
    
    func mostPopularArticles() {
        apiManager.mostPopularArticles()
            .trackActivity(activityIndicator)
            .subscribe(onNext: { [weak self] articles in
                self?.articles.value = articles
                }, onError: { error in
                    log.error("Handle error gracefully")
            })
            .disposed(by: disposeBag)
    }
    
}
