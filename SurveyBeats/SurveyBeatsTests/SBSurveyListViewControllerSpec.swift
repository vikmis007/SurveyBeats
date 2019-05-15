//
//  SBSurveyListViewControllerSpec.swift
//  SurveyBeatsTests
//
//  Created by Vikasmishra on 15/05/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

let TEST_CONTROLLER_IDENTIFIER = "SBSurveyListViewControllerIdentifier"

import UIKit

import Quick
import Nimble

@testable import SurveyBeats

class SBSurveyListViewControllerSpec: QuickSpec {
    /// ListTableView controller instance
    private var systemUnderTest: SBSurveyListViewController!
    
    /// Array to hold most popular articles from stub
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
            
            // Test loading of most popular articles
            context("loading", closure: {
                
                // Test for successful loading
                self.executeTestSuiteForSurveyListLoadingSuccess()
                
                // Test for failed loading
                self.executeTestSuiteForSurveyListLoadingFailure()
                
            })
        }
    }
    
    /// This mwthod will test failure of aricle loading
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
            
            self.systemUnderTest.initialSetup()
            expect((self.systemUnderTest.error as NSError?)?.code ?? 400).toEventually(equal(400))
        })
    }
    
    /// This mwthod will test success of aricle loading
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
            
            self.systemUnderTest.initialSetup()
            expect(self.systemUnderTest.surveyListItems.count).toEventually(equal(5))
        })
    }
    
    private func prepareForRetest() {
        systemUnderTest = UIStoryboard(
            name: "Main",
            bundle: nil)
            .instantiateViewController(
                withIdentifier: TEST_CONTROLLER_IDENTIFIER)
            as? SBSurveyListViewController
        UIApplication.shared.keyWindow!.rootViewController = systemUnderTest
    }
    
    /// Method to return failure URL for most popular articles.
    ///
    /// - Returns: URL for most popular article.
    private func surveyListApiURL() -> URL? {
        var urlComponents = URLComponents(string: SBStringConstants.kEndPoint)!
        urlComponents.path = SBStringConstants.kSurveyListAPIPath
        urlComponents.queryItems = [URLQueryItem(name: SBStringConstants.kAccessTokenKey,
                                                 value: "dummy_access_token")]
        return urlComponents.url
    }
}
