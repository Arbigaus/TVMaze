//
//  SearchView.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import SwiftUI
import Combine

struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()
    @State private var searchText = ""
    private let debouncer = Debouncer(debounceInterval: 1.2)

    var body: some View {
        List {
            ForEach(viewModel.shows) { show in
                NavigationLink(value: show) {
                    ShowCard(show: show)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .isLoading(viewModel.isLoading)
        .listRowBackground(Color.clear)
        .searchable(text: $searchText)
        .onChange(of: searchText) { newValue in
            debouncer.callAsFunction {
                Task {
                    do {
                        try await viewModel.searchShows(by: newValue)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .navigationTitle("TV Show Search")
        .navigationDestination(for: TVShow.self) { show in
            DetailView(viewModel: DetailViewModel(show: show))
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

final class Debouncer {
    private var cancellable: AnyCancellable?
    private let debounceInterval: TimeInterval

    init(debounceInterval: TimeInterval) {
        self.debounceInterval = debounceInterval
    }

    func callAsFunction(_ action: @escaping () -> Void) {
        cancellable?.cancel()
        cancellable = Just(())
            .delay(for: .seconds(debounceInterval), scheduler: RunLoop.main)
            .sink { _ in action() }
    }
}
