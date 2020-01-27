import XCTest
@testable import RatingModule

class AirportRepositoryTest: XCTestCase {

    var repository: RatingsRepository!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repository = RatingsRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repository = nil
    }
    
    func testGetAllRatings() {
        let expectationGetAllAirports: XCTestExpectation = expectation(description: "Expected to fetch all ratings from data.json with success response message")
        self.repository.getRatingsDetails(query: "LAST_7_DAYS", handler: { (response, message) in
            XCTAssertNotNil(response)
            XCTAssertEqual(message, AppConstant.ResponseMessage.getSuccess)
            expectationGetAllAirports.fulfill()
        })
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error{
                XCTFail("Failed to get all response from json")
            }
        }
    }
}

