//
//  ViewController.m
//  InteroperabilityTest
//
//  Created by alex on 8/7/17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "ViewController.h"
#import "InteroperabilityTest-Swift.h"

@interface ViewController ()
@property (nonatomic, strong) SomeSwiftClass* someSwiftClass;

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];


    // 1. Types 'CGFloat' and 'CGFloat *' are not compatible
    CGFloat bottomMargin = self.someSwiftClass.someFloatValue;
    bottomMargin++; // avoiding Xcode unused warning

    // 2. Types 'CGFloat' and 'float' are not compatible / Format specifier requires a double
    self.someSwiftClass = [[SomeSwiftClass alloc] init];
    self.someSwiftClass.someFloatValue = 3.f;
    NSLog(@"self.someSwiftClass.someFloatValue: %f", self.someSwiftClass.someFloatValue);


    // 3. Cannot resolve method
    [T silentSignInFromEndpoint:@"login" withCompletion:^(BOOL success) {
        if (success) {
            NSLog(@"Silent sign in success");
        }
    }];


    // 4. Incompatible pointer types
    T.finishedSelecting = ^(SomeSwiftClass* someSwiftClass) {
        NSLog(@"%@", someSwiftClass.someString);
    };
    T.finishedSelecting([[SomeSwiftClass alloc] init]); // Just to show that it does work


    // 5. Parameter type mismatch
    Vehicle* vehicle = [[Vehicle alloc] initWithType:VehicleTypeBoat];


    // 6. Integer expression is required
    switch (vehicle.type) {
        case VehicleTypeBoat:
            break;
        default:
            break;
    }
}

- (void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
