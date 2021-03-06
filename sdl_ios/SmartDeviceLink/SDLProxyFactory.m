//  SDLSyncProxyFactory.m
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <SmartDeviceLink/SDLProxyFactory.h>

#import <SmartDeviceLink/SDLDebugTool.h>
#import <SmartDeviceLink/SDLIAPTransport.h>
#import <SmartDeviceLink/SDLTCPTransport.h>
#import <SmartDeviceLink/SDLProtocol.h>

@implementation SDLProxyFactory

+(SDLProxy*) buildSDLProxyWithListener:(NSObject<SDLProxyListener>*) delegate {
    SDLIAPTransport* transport = [[SDLIAPTransport alloc] init];
    SDLProtocol* protocol = [[SDLProtocol alloc] init];
    SDLProxy *ret = [[SDLProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];

	return ret;
}

+(SDLProxy*) buildSDLProxyWithListener:(NSObject<SDLProxyListener>*) delegate
                              tcpIPAddress: (NSString*) ipaddress
                                   tcpPort: (NSString*) port {
    
    SDLTCPTransport* transport = [[SDLTCPTransport alloc] initWithEndpoint:ipaddress endpointParam:port];
    SDLProtocol* protocol = [[SDLProtocol alloc] init];
    SDLProxy *ret = [[SDLProxy alloc] initWithTransport:transport protocol:protocol delegate:delegate];

	return ret;
}

@end