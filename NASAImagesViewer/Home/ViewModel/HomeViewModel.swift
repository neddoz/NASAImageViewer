//
//  HomeViewModel.swift
//  NASAImagesViewer
//
//  Created by kayeli dennis on 27/06/2021.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeViewModel {
    
    var isLoading = BehaviorRelay<Bool>(value: false)
    var items = BehaviorRelay<[Item]>(value: [])
    var error = BehaviorRelay<Error?>(value: nil)
    var nextItemsLink: String?
    private let disposeBag = DisposeBag()

    init() {
        fetchItems(with: "\"\"")
    }

    func fetchItems(with query: String) {
        let client: APIClient = APIClient.shared
        let searchRequest: APIRequest = SearchRequest(query: query)
        let observable: Observable<Result<SearchResult, Error>> = client.send(apiRequest: searchRequest)
        isLoading.accept(true)
        observable.subscribe { result in
            self.isLoading.accept(false)
            switch result {
            case .success(let apiResult):
                self.items.accept(apiResult.collection.items)
            case .failure(let error):
                self.error.accept(error)
            }
        } onError: { error in
            self.isLoading.accept(false)
            self.error.accept(error)
        } .disposed(by: disposeBag)
    }
    
    func item(for row: Int)-> Item {
        return items.value[row]
    }
    
    func numberOfRows()-> Int {
        return items.value.count
    }
}
