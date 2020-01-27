import XCTest

@testable import RatingModule
class DisplayRatingDetailTest: XCTestCase {
    var repository = RatingRepositoryMock()
    var displayRatingDetail: DisplayRatingDetail!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        displayRatingDetail = DisplayRatingDetail(with: repository)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        displayRatingDetail = nil
    }
    
    func testFetchAllRatings() {
        let expectationFetchAirports: XCTestExpectation = expectation(description: "Expected to fetch response from data.json and relevant methods in RatingRepository should gets called")
        self.displayRatingDetail.fetchDetails(query: "LAST_7_DAYS", handler: { (airport, message) in
            XCTAssertTrue(self.repository.getAllRatingCalledSuccessfully)
            expectationFetchAirports.fulfill()
        })
        
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error{
                XCTFail("Failed to download data from Repository")
            }
        }
    }
}
