/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing HelloWorldThing
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef HelloWorldThing_H_
#define HelloWorldThing_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : HelloWorldThing
 *****************************************************************************/

// Definition of the instance stuct:
struct HelloWorldThing_Instance {
// Variables for the ID of the instance
int id;
// Variables for the current instance state
int HelloWorldThing_HelloWorldChart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void HelloWorldThing_HelloWorldChart_OnEntry(int state, struct HelloWorldThing_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define HELLOWORLDTHING_HELLOWORLDCHART_STATE 0
#define HELLOWORLDTHING_HELLOWORLDCHART_INIT_STATE 1



#ifdef __cplusplus
}
#endif

#endif //HelloWorldThing_H_
