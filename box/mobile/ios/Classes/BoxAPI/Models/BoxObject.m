
//
// Copyright 2011 Box.net, Inc.
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

#import "BoxObject.h"



@implementation BoxObject

@synthesize objectId = _objectId;
@synthesize objectName = _objectName;
@synthesize objectDescription = _objectDescription;
@synthesize userId = _userId;
@synthesize isShared = _isShared;
@synthesize sharedLink = _sharedLink;
@synthesize permissions = _permissions;
@synthesize objectSize = _objectSize;
@synthesize objectCreatedTime = _objectCreatedTime;
@synthesize objectUpdatedTime = _objectUpdatedTime;
@synthesize objectPath = _objectPath;

-(void)releaseAndNilValues {
	self.objectId = nil;
	self.objectName = nil;
	self.objectDescription = nil;
	self.userId = nil;
	self.sharedLink = nil;
	self.permissions = nil;
	self.objectSize = nil;
	self.objectCreatedTime = nil;
	self.objectUpdatedTime = nil;
	self.objectPath = nil;
}

- (void)setValuesWithDictionary:(NSDictionary *)values {
	if([values objectForKey:@"id"]) {
		self.objectId = [NSNumber numberWithLongLong:[((NSString*)[values objectForKey:@"id"]) longLongValue]];
	}
	if([values objectForKey:@"name"] || [values objectForKey:@"file_name"]) {
		self.objectName = ([values objectForKey:@"name"] == nil) ? [values objectForKey:@"file_name"] : [values objectForKey:@"name"];
	}
	if([values objectForKey:@"description"]) {
		self.objectDescription = [values objectForKey:@"description"];
	}
	if([values objectForKey:@"user_id"]) {
		self.userId = [values objectForKey:@"user_id"];
	}
	if([values objectForKey:@"shared"]) {
		self.isShared = ([((NSString*)[values objectForKey:@"shared"]) isEqualToString:@"1"] ? YES : NO);
	}
	if([values objectForKey:@"shared_link"]) {
		self.sharedLink = [values objectForKey:@"shared_link"];
	}
	if([values objectForKey:@"permissions"]) {
		self.permissions = [values objectForKey:@"permissions"];
	}
	if([values objectForKey:@"size"]) {
		self.objectSize = [NSNumber numberWithLongLong:[((NSString*)[values objectForKey:@"size"]) longLongValue]];
	}
	if([values objectForKey:@"created"]) {
		self.objectCreatedTime = [NSDate dateWithTimeIntervalSince1970:[[values objectForKey:@"created"] doubleValue]];
	}
	if([values objectForKey:@"updated"]) {
		self.objectUpdatedTime = [NSDate dateWithTimeIntervalSince1970:[[values objectForKey:@"updated"] doubleValue]];
	}
	if([values objectForKey:@"objectPath"]) {
		self.objectPath = [values objectForKey:@"objectPath"];
	}
}

- (NSMutableDictionary *)getValuesInDictionaryForm {
	NSMutableDictionary *returnDict = [[[NSMutableDictionary alloc] initWithCapacity:10] autorelease];
	if(self.objectId) {
		[returnDict setObject:[NSString stringWithFormat:@"%@", self.objectId] forKey:@"id"];
	}
	if(self.objectName) {
		[returnDict setObject:self.objectName forKey:@"name"];
	}
	if(self.objectDescription) {
		[returnDict setObject:self.objectDescription forKey:@"description"];
	}
	if(self.userId) {
		[returnDict setObject:self.userId forKey:@"user_id"];
	}
	if(self.isShared) {
		[returnDict setObject:@"1" forKey:@"shared"];
	} else {
		[returnDict setObject:@"0" forKey:@"shared"];
	}
	if(self.sharedLink) {
		[returnDict setObject:self.sharedLink forKey:@"shared_link"];
	}
	if(self.permissions) {
		[returnDict setObject:self.permissions forKey:@"permissions"];
	}
	if(self.objectSize) {
		[returnDict setObject:[NSString stringWithFormat:@"%@", self.objectSize] forKey:@"size"];
	}
	if(self.objectCreatedTime) {
		[returnDict setObject:[NSString stringWithFormat:@"%u", [self.objectCreatedTime timeIntervalSince1970]] forKey:@"created"];
	}
	if(self.objectUpdatedTime) {
		[returnDict setObject:[NSString stringWithFormat:@"%u", [self.objectUpdatedTime timeIntervalSince1970]] forKey:@"updated"];
	}
	if(self.objectPath) {
		[returnDict setObject:self.objectPath forKey:@"objectPath"];
	}

	return returnDict;
}

- (id)initWithDictionary:(NSDictionary *)values {
	if (self = [super init]) {
		[self setValuesWithDictionary:values];
	}

	return self;
}

- (void)dealloc {
	[self releaseAndNilValues];
	[super dealloc];
}

- (NSString *)objectToString {
	return nil;
}



@end
