#include "register_types.h"
#include <core/engine.h>
#include "core/class_db.h"
#include "core/global_constants.h"
#include "ios/src/godotfacebook.h"

void register_facebook_types(){
    Engine::get_singleton()->add_singleton(Engine::Singleton("GodotFacebook", memnew(GodotFacebook)));
}

void unregister_facebook_types(){
}
