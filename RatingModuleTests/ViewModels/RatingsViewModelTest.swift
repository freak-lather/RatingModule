import XCTest
@testable import RatingModule
class RatingsViewModelTest: XCTestCase {

    let interactor = DisplayRatingMock()
    var viewModel: RatingsListViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = RatingsListViewModel(with: interactor)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testDidLoad() {
        let didLoadExpectation: XCTestExpectation = expectation(description: "Expected to fetch all response from data.json and view should be reloaded, also relevant method from Interactor")
        viewModel.reload = { [unowned self] in
            XCTAssertEqual(self.viewModel.numberOfRows(index: 1), 0)
            XCTAssertTrue(self.interactor.fetchAllRatingCalledSuccessfully)
            didLoadExpectation.fulfill()
        }
        viewModel.didLoad()
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error{
                XCTFail("Failed to load all response")
            }
        }
    }
    
    func testWillRefereshScreenData() {
        let willRefreshExpectation: XCTestExpectation = expectation(description: "Expected to fetch all response from data.json and view should be refreshed/reloaded, also relevant method from Interactor")
        viewModel.reload = { [unowned self] in
            XCTAssertEqual(self.viewModel.numberOfRows(index: 0), 1)
            XCTAssertTrue(self.interactor.fetchAllRatingCalledSuccessfully)
            willRefreshExpectation.fulfill()
        }
        viewModel.willRefreshScreenData()
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error{
                XCTFail("Failed to refresh/reload all response")
            }
        }
    }
}

// TODO:- There should be more  test cases
