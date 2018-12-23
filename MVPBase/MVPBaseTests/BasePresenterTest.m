//
//  BasePresenterTest.m
//  MVPBaseTests
//
//  Created by ShenYj on 2018/12/17.
//  Copyright © 2018 ShenYj. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BasePresenter.h"
#import <OCMock.h>


@interface BasePresenterTest : XCTestCase

@end

@implementation BasePresenterTest

+ (void)setUp {
    [super setUp];
}

+ (void)tearDown {
    [super tearDown];
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    [super tearDown];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
//    int a = 1;
//    int b = 2;
//    int c ;
//
//    BasePresenter *p = [[BasePresenter alloc] init];
//    c = [p add:a with:b];
//    XCTAssertEqual(c, 3);
    
    id objectMock = OCMClassMock([UIView class]);
    id controllerMock = OCMClassMock([UIViewController class]);
    BasePresenter *presenterMock = [[BasePresenter alloc] initWithObject:objectMock controller:controllerMock];
//    OCMStub([[BasePresenter alloc] initWithObject:objectMock controller:controllerMock])._andReturn(presenterMock);
//    [presenterMock detachObject];
    OCMVerify([presenterMock detachObject]);
    XCTAssertNil(objectMock, @"Object is not nil !");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
