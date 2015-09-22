/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *        Implementation for Thing HelloWorldThing
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#include "HelloWorldThing.h"

/*****************************************************************************
 * Implementation for type : HelloWorldThing
 *****************************************************************************/

// Declaration of prototypes:
void HelloWorldThing_HelloWorldChart_OnExit(int state, struct HelloWorldThing_Instance *_instance);
// Declaration of functions:

// On Entry Actions:
void HelloWorldThing_HelloWorldChart_OnEntry(int state, struct HelloWorldThing_Instance *_instance) {
switch(state) {
case HELLOWORLDTHING_HELLOWORLDCHART_STATE:
_instance->HelloWorldThing_HelloWorldChart_State = HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE;
HelloWorldThing_HelloWorldChart_OnEntry(_instance->HelloWorldThing_HelloWorldChart_State, _instance);
break;
case HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE:
fprintf(stderr, "Hello World!");
break;
default: break;
}
}

// On Exit Actions:
void HelloWorldThing_HelloWorldChart_OnExit(int state, struct HelloWorldThing_Instance *_instance) {
switch(state) {
case HELLOWORLDTHING_HELLOWORLDCHART_STATE:
HelloWorldThing_HelloWorldChart_OnExit(_instance->HelloWorldThing_HelloWorldChart_State, _instance);
break;
case HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE:
break;
default: break;
}
}

// Event Handlers for incoming messages:

// Observers for outgoing messages:



