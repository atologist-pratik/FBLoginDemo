#include "godotfacebook.h"
#import "app_delegate.h"

#import <Foundation/Foundation.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <Bolts/Bolts.h>


GodotFacebook::GodotFacebook() {
    ERR_FAIL_COND(instance != NULL);
    instance = this;
    initialized = false;
    callbackId = 0;
}

GodotFacebook::~GodotFacebook() {
    instance = NULL;
}


void GodotFacebook::init(const String &fbAppId){
    NSLog(@"GodotFacebook Module initialized");
    NSDictionary *launchOptions = @{};
    [[FBSDKApplicationDelegate sharedInstance] application:[UIApplication sharedApplication]
    didFinishLaunchingWithOptions:launchOptions];
    initialized = true;
}

void GodotFacebook::login(){
    NSLog(@"GodotFacebook Module login");
}

void GodotFacebook::logout(){
    NSLog(@"GodotFacebook Module logout");
}

void GodotFacebook::setFacebookCallbackId(int cbackId){
    NSLog(@"GodotFacebook Module set callback id");
    callbackId = cbackId;
}

int GodotFacebook::getFacebookCallbackId(){
    NSLog(@"GodotFacebook Module get callback id");
    return callbackId;
}

bool GodotFacebook::isLoggedIn(){
    NSLog(@"GodotFacebook Module is logged in");
    return false;
}

void GodotFacebook::shareLink(const String &url, const String &quote){
    NSLog(@"GodotFacebook Module share link content");
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.quote = [NSString stringWithCString:quote.utf8().get_data() encoding: NSUTF8StringEncoding];
    content.contentURL = [NSURL URLWithString:[NSString stringWithCString:url.utf8().get_data() encoding: NSUTF8StringEncoding]];
    FBSDKShareDialog *shareDialog = [[FBSDKShareDialog alloc] init];
    shareDialog.fromViewController = [AppDelegate getViewController];
    shareDialog.shareContent = content;
    [shareDialog show];
}

void GodotFacebook::shareLinkWithoutQuote(const String &url){
    NSLog(@"GodotFacebook Module share link without quote");
    FBSDKShareLinkContent *content = [[FBSDKShareLinkContent alloc] init];
    content.contentURL = [NSURL URLWithString:@"https://www.facebook.com/FacebookDevelopers"];
    FBSDKShareDialog *shareDialog = [[FBSDKShareDialog alloc] init];
    shareDialog.fromViewController = [AppDelegate getViewController];
    shareDialog.shareContent = content;
    [shareDialog show];
}



void GodotFacebook::_bind_methods() {
    ClassDB::bind_method("init",&GodotFacebook::init);
    ClassDB::bind_method("login",&GodotFacebook::login);
    ClassDB::bind_method("logout",&GodotFacebook::logout);
    ClassDB::bind_method("setFacebookCallbackId",&GodotFacebook::setFacebookCallbackId);
    ClassDB::bind_method("getFacebookCallbackId",&GodotFacebook::getFacebookCallbackId);
    ClassDB::bind_method("isLoggedIn",&GodotFacebook::isLoggedIn);
    ClassDB::bind_method("shareLink",&GodotFacebook::shareLink);
    ClassDB::bind_method("shareLinkWithoutQuote",&GodotFacebook::shareLinkWithoutQuote);
}
