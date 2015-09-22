/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing T2
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef T2_H_
#define T2_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : T2
 *****************************************************************************/

// Definition of the instance stuct:
struct T2_Instance {
// Variables for the ID of the instance
int id;
// Variables for the ID of the ports of the instance
uint16_t id_p1;
uint16_t id_p2;
// Variables for the current instance state
int T2_chart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void T2_chart_OnEntry(int state, struct T2_Instance *_instance);
void T2_handle_p1_m2(struct T2_Instance *_instance);
void T2_handle_p1_m(struct T2_Instance *_instance);
void T2_handle_p1_m3(struct T2_Instance *_instance);
void T2_handle_p2_m2(struct T2_Instance *_instance);
void T2_handle_p2_m(struct T2_Instance *_instance);
void T2_handle_p2_m3(struct T2_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define T2_CHART_STATE 0
#define T2_CHART_INIT_STATE 1



#ifdef __cplusplus
}
#endif

#endif //T2_H_
