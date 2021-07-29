#import <Foundation/Foundation.h>
#import "SampleXCUITests-Swift.h"
#import <XCTest/XCTest.h>


__attribute__((constructor))
void CucumberishInit()
{
    [SampleXCUITests cucumberishSwiftInit];
}
