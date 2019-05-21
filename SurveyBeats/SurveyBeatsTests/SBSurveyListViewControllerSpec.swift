//
//  SBSurveyListViewControllerSpec.swift
//  SurveyBeatsTests
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

let testControllerIdentifier = "SurveyListViewControllerIdentifier"

import UIKit
import Quick
import Nimble

@testable import SurveyBeats

class SurveyListViewControllerSpec: QuickSpec {
    /// ListTableView controller instance
    private var systemUnderTest: SurveyListViewController!

    /// Array to hold SurveyType model objects from stub
    private var surveyListItems: [SurveyType]!

    /// Success URL for mocking API
    private var successURL: URL?

    /// Failure URL for mocking API
    private var failureURL: URL?

    override func spec() {
        successURL = self.surveyListApiURL()
        failureURL = self.surveyListApiURL()

        beforeEach {
            self.prepareForRetest()
        }

        describe("Load Survey list") {

            // Test loading of survey list items
            context("loading", closure: {

                // Test for successful loading
                self.executeTestSuiteForSurveyListLoadingSuccess()

                // Test for failed loading
                self.executeTestSuiteForSurveyListLoadingFailure()

            })
        }
    }

    /// This mwthod will test failure of survey list loading
    private func executeTestSuiteForSurveyListLoadingFailure() {

        it("failed", closure: {
            guard let failureJSONURL = Bundle(for: type(of: self))
                .url(forResource: "SurveyListFailureData", withExtension: "json") else {
                    fail("Bundle URL found nil.")
                    return
            }

            guard let data = try? Data(contentsOf: failureJSONURL) else {
                fail("Stub data is empty.")
                return
            }

            guard let serverURL = self.failureURL else {
                fail("Invalid URL")
                return
            }

            let urlResponse = HTTPURLResponse(
                url: serverURL,
                statusCode: 400,
                httpVersion: "HTTP/1.1",
                headerFields: nil
            )
            let error: NSError = NSError(
                domain: "Network Domain",
                code: urlResponse?.statusCode ?? 400,
                userInfo: [NSLocalizedDescriptionKey: "Bad request"]
            )

            let sessionMock = URLSessionMock(data: data, response: urlResponse, error: error)
            self.systemUnderTest.urlSesssion = sessionMock
            Util.setAccessToken(token: "dummy")
            self.systemUnderTest.initialSetup()
            Util.setAccessToken(token: nil)
            expect((self.systemUnderTest.error as NSError?)?.code ?? 400).toEventually(equal(400))
        })
    }

    /// This mwthod will test success of survey list loading
    private func executeTestSuiteForSurveyListLoadingSuccess() {

        it("success", closure: {
            guard let successJSONURL = Bundle(for: type(of: self))
                .url(forResource: "SurveyListSuccessData", withExtension: "json") else {
                    fail("Bundle URL found nil.")
                    return
            }

            guard let data = try? Data(contentsOf: successJSONURL) else {
                fail("Stub data is empty.")
                return
            }

            guard let serverURL = self.successURL else {
                fail("Invalid URL")
                return
            }

            let urlResponse = HTTPURLResponse(
                url: serverURL,
                statusCode: 200,
                httpVersion: "HTTP/1.1",
                headerFields: nil
            )

            let sessionMock = URLSessionMock(data: data, response: urlResponse, error: nil)
            self.systemUnderTest.urlSesssion = sessionMock

            Util.setAccessToken(token: "dummy")
            self.systemUnderTest.initialSetup()
            Util.setAccessToken(token: nil)
            expect(self.systemUnderTest.surveyListItems.count).toEventually(equal(5))
        })
    }

    private func prepareForRetest() {
        systemUnderTest = UIStoryboard(
            name: "Main",
            bundle: nil)
            .instantiateViewController(
                withIdentifier: testControllerIdentifier)
            as? SurveyListViewController
        UIApplication.shared.keyWindow!.rootViewController = systemUnderTest
    }

    /// Method to return URL for survey list API.
    ///
    /// - Returns: URL .
    private func surveyListApiURL() -> URL? {
        var urlComponents = URLComponents(string: StringConstants.kEndPoint)!
        urlComponents.path = StringConstants.kSurveyListAPIPath
        urlComponents.queryItems = [URLQueryItem(name: StringConstants.kAccessTokenKey,
                                                 value: "dummy_access_token")]
        return urlComponents.url
    }
}
