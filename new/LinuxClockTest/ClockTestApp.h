/*****************************************************
 *      THIS IS A GENERATED FILE. DO NOT EDIT.
 *           Header for Thing ClockTestApp
 *  Generated from ThingML (http://www.thingml.org)
 *****************************************************/

#ifndef ClockTestApp_H_
#define ClockTestApp_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "thingml_typedefs.h"

/*****************************************************************************
 * Headers for type : ClockTestApp
 *****************************************************************************/

// Definition of the instance stuct:
struct ClockTestApp_Instance {
// Variables for the ID of the ports of the instance
uint16_t id_clock1;
// Handler Array
struct Msg_Handler * clock1_handlers;
uint16_t id_clock2;
// Handler Array
struct Msg_Handler * clock2_handlers;
// Variables for the current instance state
int ClockTestApp_LinuxClockTestAppImpl_State;
// Variables for the properties of the instance

};
// Declaration of prototypes outgoing messages:
void ClockTestApp_LinuxClockTestAppImpl_OnEntry(int state, struct ClockTestApp_Instance *_instance);
void ClockTestApp_handle_clock1_clock_tick(struct ClockTestApp_Instance *_instance);
void ClockTestApp_handle_clock2_clock_tick(struct ClockTestApp_Instance *_instance);
// Declaration of callbacks for incoming messages:

// Definition of the states:
#define CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_STATE 0
#define CLOCKTESTAPP_LINUXCLOCKTESTAPPIMPL_RUNNING_STATE 1



#ifdef __cplusplus
}
#endif

#endif //ClockTestApp_H_
