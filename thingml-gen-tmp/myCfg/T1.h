/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing T1
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef T1_H_
#define T1_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : T1
 *****************************************************************************/

// Definition of the instance stuct:
struct T1_Instance {
// Variables for the ID of the instance
int id;
// Variables for the ID of the ports of the instance
uint16_t id_p1;
uint16_t id_p2;
// Variables for the current instance state
int T1_chart_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void T1_chart_OnEntry(int state, struct T1_Instance *_instance);
// Declaration of callbacks for incoming messages:
void register_T1_send_p1_m_listener(void (*_listener)(struct T1_Instance *));
void register_external_T1_send_p1_m_listener(void (*_listener)(struct T1_Instance *));
void register_T1_send_p1_m2_listener(void (*_listener)(struct T1_Instance *));
void register_external_T1_send_p1_m2_listener(void (*_listener)(struct T1_Instance *));
void register_T1_send_p2_m_listener(void (*_listener)(struct T1_Instance *));
void register_external_T1_send_p2_m_listener(void (*_listener)(struct T1_Instance *));
void register_T1_send_p2_m2_listener(void (*_listener)(struct T1_Instance *));
void register_external_T1_send_p2_m2_listener(void (*_listener)(struct T1_Instance *));

// Definition of the states:
#define T1_CHART_STATE 0
#define T1_CHART_INIT_STATE 1



#ifdef __cplusplus
}
#endif

#endif //T1_H_
