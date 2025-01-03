import Foundation
import SwiftUI

protocol NetworkActiveViewModelProtocol {
  /// Error to be displayed (if any).
  var error: Error? { get }
  
  /// Executes initial load of the items.
  func loadInitialData() async
  
  /// Clears items and make initial load call.
  func refresh() async
  
  ///
  func fetchNextListOfData() async
}

protocol ListViewModelProtocol: ObservableObject, NetworkActiveViewModelProtocol {
  /// The state of view.
  var state: ListViewState { get }
}

/// The state of the view.
enum ListViewState: Equatable {
    
    /// idle
    case idle
    
    /// Loading is in progress.
    case loading
    
    /// Loaded already.
    case loaded
    
    /// Error
    case error(Error)
    
    // MARK: - Conformance: Equatable
    
    static func == (lhs: ListViewState, rhs: ListViewState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle),
            (.loading, .loading),
            (.loaded, .loaded):
            return true
        case (.error(let lhsError), .error(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        default:
            return false
        }
    }
}
