//
//  NSObject+PerformSelector.h
//  JustepX5
//
//  Created by x5 on 13-1-17.
//
//

#import "NSObject+PerformSelector.h"

@implementation NSObject (PerformSelector)

-(id)performSelector:(NSString *)methodName withParams:(NSArray *)params withOptions:(NSDictionary *)dict {
    SEL aSelector = nil;
    
    if(dict == nil || dict == NULL || [dict count] == 0){
        aSelector = NSSelectorFromString(methodName);
    }else if([methodName hasSuffix:@":"]){
        aSelector = NSSelectorFromString([[[NSString alloc] initWithFormat:@"%@withDic:",methodName] autorelease]);
    }else {
        aSelector = NSSelectorFromString([[[NSString alloc] initWithFormat:@"%@WithDic:",methodName] autorelease]);
    }
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    
    
    
    int paramCount = [params count];
    
    for (int i = 0 ; i < paramCount ; i++) {
       NSObject *object = params[i];
       [invocation setArgument:&object atIndex:i+2];
    }
    
    if(!(dict == nil || dict == NULL || [dict count] == 0)){
        [invocation setArgument:&dict atIndex:paramCount+2];
    }
    
    if([self respondsToSelector:aSelector]){
        [invocation setTarget:self];
        [invocation setSelector:aSelector];
        [invocation invoke];
        
        if ([signature methodReturnLength]) {
            id data;
            [invocation getReturnValue:&data];
            return data;
        }
    }else {
       NSLog(@"Class method '%@' not defined", methodName);
    }
    return nil;
}

@end
